// ignore_for_file: unused_field, prefer_typing_uninitialized_variables

import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/booking_content.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';
import 'package:weather/weather.dart';

class WellcomeController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  Rx<BookingContent?> bookingContent = Rx<BookingContent?>(null);
  late Timer _timer;
  double? weatherCelsius = 0;
  String url = "";
  var formattedTime = "".obs;
  var formattedDate = "".obs;

  var nameCus;
  var welcomeContent = "Xin chào buổi chiều ";
  var birthdayContent = "Chúc mừng sinh nhật ";
  var title = "";
  var content = "";
  AudioPlayer player = AudioPlayer();

  void audio() async {
    String audioasset = "assets/audios/audio.mp3";
    Uint8List? audiobytes;
    ByteData bytes = await rootBundle.load(audioasset);
    audiobytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    player.setVolume(40);
    await player.playBytes(audiobytes);
  }

  void stopAudio() {
    player.stop();
  }

  void loadTitle() {
    String currentDay = DateFormat('dd/MM/yyyy').format(DateTime.now());
    nameCus =
        "${bookingContent.value?.customer?.gender == 0 ? 'Chị' : 'Anh'} ${bookingContent.value?.customer?.lastName}";
    title = welcomeContent + nameCus;
    if (bookingContent.value?.customer?.birthDate == currentDay) {
      title = birthdayContent + nameCus;
      FlutterRingtonePlayer.play(
        fromAsset: "assets/audios/alarm.mp3",
        volume: 10,
      );
      //  audio();
    }
    content =
        "Chúc ${bookingContent.value?.customer?.gender == 0 ? 'Chị' : 'Anh'} có một kỳ nghỉ tuyệt vời";
  }

  void stopRingtone() {
    FlutterRingtonePlayer.stop();
  }

  @override
  void onInit() async {
    timing();
    await fetchBooking(11);
    loadTitle();
    super.onInit();
  }

  Future<void> fetchBooking(int roomId) async {
    var overview = _repository.getBookingByRoomId(roomId);
    await callDataService(
      overview,
      onSuccess: (BookingContent response) {
        bookingContent(response);
      },
      onError: ((dioError) {}),
    );
  }

  void timing() async {
    _timer = Timer.periodic(
      const Duration(milliseconds: 500),
      (timer) {
        updateTime();
        getWeather();
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

  void getWeather() async {
    double lat = 10.7683;
    double lon = 106.6758;
    WeatherFactory wf = WeatherFactory("856822fd8e22db5e1ba48c0e7d69844a",
        language: Language.VIETNAMESE);
    Weather w = await wf.currentWeatherByLocation(lat, lon);
    weatherCelsius = w.temperature!.celsius ?? 0;
    String weatherIcon = w.weatherIcon!;
    url = "http://openweathermap.org/img/wn/$weatherIcon@2x.png";

    update();
  }
}
