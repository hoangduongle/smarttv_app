// ignore_for_file: unused_field, prefer_typing_uninitialized_variables, unused_local_variable

import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/booking_content.dart';
import 'package:smarttv_app/app/core/model/customer_content.dart';
import 'package:smarttv_app/app/data/data.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class WellcomeController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  Rx<BookingContent?> bookingContent = Rx<BookingContent?>(null);
  Rx<CustomerContent?> primaryCustomerContent = Rx<CustomerContent?>(null);
  late Timer _timer;
  var formattedTime = "".obs;
  var formattedDate = "".obs;

  var nameCus;
  var welcomeContent = "Xin chào ";
  var timeforsession = "";
  var birthdayContent = "Chúc mừng sinh nhật ";
  var title = "";
  var content = "";
  AudioPlayer player = AudioPlayer();

  @override
  void onInit() async {
    timing();
    await fetchBooking(roomId);
    super.onInit();
  }

  void audio() async {
    String audioasset = "assets/audios/audio.mp3";
    Uint8List? audiobytes;
    ByteData bytes = await rootBundle.load(audioasset);
    audiobytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    debugPrint("Bytes: ${bytes.toString()}");
    player.setVolume(40);
    await player.playBytes(audiobytes);
  }

  void stopAudio() {
    player.stop();
  }

  String getGender(int number) {
    String result = "";
    switch (number) {
      case 0:
        result = " Chị";
        break;
      case 1:
        result = " Anh";
        break;
      case 2:
        result = " Chị";
        break;
    }
    return result;
  }

  void loadTitle() {
    String currentDay = DateFormat('dd/MM').format(DateTime.now());
    int formattedHours = int.parse(DateFormat('HH').format(DateTime.now()));
    if (bookingContent.value != null) {
      nameCus =
          "${getGender(primaryCustomerContent.value!.gender!)} ${primaryCustomerContent.value!.lastName}";
      if (formattedHours >= 00) {
        timeforsession = 'buổi sáng';
      }
      if (formattedHours >= 12) {
        timeforsession = 'buổi trưa';
      }
      if (formattedHours >= 13) {
        timeforsession = 'buổi chiều ';
      }
      if (formattedHours >= 18) {
        timeforsession = 'buổi tối';
      }
      title = welcomeContent + timeforsession + nameCus;
      String? birthday =
          primaryCustomerContent.value?.birthDate?.substring(0, 5);
      if (birthday == currentDay) {
        title = birthdayContent + nameCus;
        audio();
      }
      content =
          "Chúc ${getGender(primaryCustomerContent.value!.gender!)} có một kỳ nghỉ tuyệt vời";
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
