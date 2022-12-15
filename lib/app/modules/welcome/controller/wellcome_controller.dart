// ignore_for_file: unused_field, prefer_typing_uninitialized_variables, unused_local_variable

import 'dart:async';
import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/booking_content.dart';
import 'package:smarttv_app/app/core/model/customer_content.dart';
import 'package:smarttv_app/app/core/model/setting_content.dart';
import 'package:smarttv_app/app/data/data.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class WellcomeController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  Rx<BookingContent?> bookingContent = Rx<BookingContent?>(null);
  Rx<CustomerContent?> primaryCustomerContent = Rx<CustomerContent?>(null);

  Rx<SettingContent?> setting = Rx<SettingContent?>(null);

  late Timer _timer;
  var formattedTime = "".obs;
  var formattedDate = "".obs;

  var nameCus;
  var timeforsession = "";
  var title = "";
  var content = "";
  AudioPlayer player = AudioPlayer();

  @override
  void onInit() async {
    timing();
    readJson();
    await fetchBooking(roomId);
    super.onInit();
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/models/setting-screen.json');
    final data = await json.decode(response);
    setting(SettingContent.fromJson(data));
  }

  void audio() async {
    String audioasset = "assets/audios/audio.mp3";
    Uint8List? audiobytes;
    ByteData bytes = await rootBundle.load(audioasset);

    audiobytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    await player.playBytes(audiobytes, volume: 20);
  }

  void stopAudio() {
    player.stop();
  }

  String getGender(int number) {
    String result = "";
    List<String>? gender = setting.value!.gender?.split("/");
    switch (number) {
      case 0: //female
        result = gender![1];
        break;
      case 1: //male
        result = gender![0];
        break;
      case 2: //other
        result = gender![1];
        break;
    }
    return result;
  }

  String timeSession(int formattedHours) {
    String result = "";
    if (formattedHours >= 00) {
      result = 'buổi sáng';
    }
    if (formattedHours >= 12) {
      result = 'buổi trưa';
    }
    if (formattedHours >= 13) {
      result = 'buổi chiều';
    }
    if (formattedHours >= 18) {
      result = 'buổi tối';
    }
    return result;
  }

  void loadTitle() {
    String currentDay = DateFormat('dd/MM').format(DateTime.now());
    int formattedHours = int.parse(DateFormat('HH').format(DateTime.now()));

    if (bookingContent.value != null) {
      nameCus =
          "${getGender(primaryCustomerContent.value!.gender!)} ${primaryCustomerContent.value!.lastName}";
      timeforsession = timeSession(formattedHours);
      title = "${setting.value?.welcome} $timeforsession $nameCus";
      String? birthday =
          primaryCustomerContent.value?.birthDate?.substring(0, 5);
      if (birthday == currentDay) {
        title = "${setting.value?.birthday} $nameCus";
        audio();
      }
      content =
          "${setting.value?.wish1} ${getGender(primaryCustomerContent.value!.gender!)} ${setting.value?.wish2}";
    }
  }

  Future<void> fetchBooking(int roomId) async {
    var overview = _repository.getBookingByRoomId(roomId);
    await callDataService(overview,
        onSuccess: (BookingContent response) {
          bookingContent(response);
        },
        onError: ((dioError) {}),
        onComplete: () async {
          await getPrimaryCustomerByBookingId(bookingContent.value!.id!);
        });
  }

  Future<void> getPrimaryCustomerByBookingId(int bookingId) async {
    var overview = _repository.getPrimaryCustomerByBookingId(bookingId);
    await callDataService(overview,
        onSuccess: (CustomerContent response) {
          primaryCustomerContent(response);
        },
        onError: ((dioError) {}),
        onComplete: () {
          loadTitle();
        });
  }

  void timing() async {
    _timer = Timer.periodic(
      const Duration(milliseconds: 500),
      (timer) {
        updateTime();
      },
    );
  }

  void updateTime() {
    Intl.defaultLocale = 'en_US';
    initializeDateFormatting();
    formattedTime = DateFormat('hh:mm a').format(DateTime.now()).obs;
    Intl.defaultLocale = 'vi_VN';
    formattedDate = DateFormat('EEEE, dd/MM/y').format(DateTime.now()).obs;
    update();
  }
}
