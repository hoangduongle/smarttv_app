// ignore_for_file: unrelated_type_equality_checks, unused_import, unused_field
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:smarttv_app/app/core/model/service_category_content.dart';
import 'package:smarttv_app/app/modules/home/controller/home_controller.dart';
import 'package:smarttv_app/app/modules/notification/controller/notification_controller.dart';
import 'package:smarttv_app/app/modules/service/controller/service_controller.dart';
import 'package:smarttv_app/app/modules/service_components/controller/list_service_controller.dart';

class MainController extends GetxController {
  late Timer _timer;
  var formattedTime = "".obs;

  get currentTime => formattedTime;

  @override
  void onInit() {
    timing();
    timingDependencies();

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

  void timingDependencies() {
    _timer = Timer.periodic(
      const Duration(minutes: 30),
      (timer) {
        autoReload();
      },
    );
  }

  void updateTime() {
    Intl.defaultLocale = 'vi_VN';
    initializeDateFormatting();
    formattedTime = DateFormat('hh:mm a').format(DateTime.now()).obs;

    update();
  }

  void autoReload() {
    debugPrint("Time to refesh fetch Api");
    // HomeController().fetchOverViews();
    // ServiceController().fetchServiceCategory();
    // ListServiceController().fetchServices();
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