import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/routes/app_pages.dart';

class AlarmController extends BaseController {
  late Timer _timer;
  bool isOn = false;
  int alarmId = 1;
  var formattedTime = "".obs;

  @override
  void onInit() {
    // timing();
    super.onInit();
  }

  void fireAlarm() {
    Intl.defaultLocale = 'vi_VN';
    initializeDateFormatting();
    formattedTime = DateFormat('hh:mm a').format(DateTime.now()).obs;
    debugPrint(formattedTime.toString());
    if (formattedTime.toString() == "08:16 CH") {
      // Get.toNamed(Routes.BIRTHDAY);
    }
  }

  void timing() {
    _timer = Timer.periodic(
      const Duration(milliseconds: 500),
      (timer) {
        fireAlarm();
      },
    );
  }
}
