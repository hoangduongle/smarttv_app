// ignore_for_file: unrelated_type_equality_checks, unused_import, unused_field, await_only_futures
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/message_content.dart';
import 'package:smarttv_app/app/core/model/service_category_content.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';
import 'package:smarttv_app/app/modules/home/controller/home_controller.dart';
import 'package:smarttv_app/app/modules/notification/controller/notification_controller.dart';
import 'package:smarttv_app/app/modules/service/controller/service_controller.dart';
import 'package:smarttv_app/app/modules/service_components/controller/list_service_controller.dart';

class MainController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  Rx<List<MessageContent>> messages = Rx<List<MessageContent>>([]);

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
        Intl.defaultLocale = 'en_US';
        initializeDateFormatting();
        formattedTime = DateFormat('hh:mm a').format(DateTime.now()).obs;
        update();
      },
    );
  }

  void timingDependencies() {
    _timer = Timer.periodic(
      const Duration(minutes: 30),
      (timer) {
        debugPrint("Time to refesh fetch Api");
      },
    );
  }

  void refreshMessage() {
    _timer = Timer.periodic(
      const Duration(minutes: 5),
      (timer) async {
        final prefs = await SharedPreferences.getInstance();
        var bookingId = await prefs.getInt("bookingId");
        fetchMessages(bookingId!);
        update();
      },
    );
  }

  Future<void> fetchMessages(int bookingId) async {
    var servicecate = _repository.getListMessage(bookingId);
    List<MessageContent> result = [];
    await callDataService(
      servicecate,
      onSuccess: (List<MessageContent> response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    messages(result);
    // debugPrint(serviceCateListTMP.value.length.toString());
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