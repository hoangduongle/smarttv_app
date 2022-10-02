// ignore_for_file: unrelated_type_equality_checks, unused_import, unused_field
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class MainController extends GetxController {
  late Timer _timer;
  var formattedTime = "".obs;

  get currentTime => formattedTime;

  @override
  void onInit() {
    timing();
    super.onInit();
  }

  void timing() {
    _timer = Timer.periodic(
      const Duration(milliseconds: 500),
      (timer) {
        updateTime();
      },
    );
  }

  void updateTime() {
    Intl.defaultLocale = 'vi_VN';
    initializeDateFormatting();
    formattedTime = DateFormat('hh:mm a').format(DateTime.now()).obs;
    update();
  }
}
  // var language = "vietnamese".obs;
  // void switchLanguage() {
  //   if (isSwitch) {
  //     Get.updateLocale(const Locale('vi', 'Vi'));
  //     language = "english".obs;
  //   } else {
  //     Get.updateLocale(const Locale('en', 'US'));
  //     language = "vietnamese".obs;
  //   }
  // }
  //  bool isSwitch = false;