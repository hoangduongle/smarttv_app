// ignore_for_file: unused_field

import 'dart:async';

import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class WellcomeController extends GetxController {
  late Timer _timer;
  double? weatherCelsius = 0;
  String url = "";
  var formattedTime = "".obs;
  var formattedDate = "".obs;

  @override
  void onInit() {
    timing();
    super.onInit();
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
    Intl.defaultLocale = 'vi_VN';
    initializeDateFormatting();
    formattedTime = DateFormat('hh:mm a').format(DateTime.now()).obs;
    formattedDate = DateFormat('EEEE, dd - MM - y').format(DateTime.now()).obs;

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

  var image = [
    "https://i.ibb.co/hCf5LTX/homepage.jpg",
    "https://i.ibb.co/pxdphfN/service.jpg",
    "https://i.ibb.co/NKzWxKQ/event.jpg",
    "https://i.ibb.co/L69PWnr/local.png",
    "https://i.ibb.co/F3FN8vx/promotion.png",
  ];
}
