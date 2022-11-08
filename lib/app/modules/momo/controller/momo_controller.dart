// ignore_for_file: unrelated_type_equality_checks

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/momo_content.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class MomoController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());

  Rx<MomoContent?> momo = Rx<MomoContent?>(null);

  Future<void> fetchPaymentMomo(int orderId, int orderInfo) async {
    var overview = _repository.momoPayment(orderId, orderInfo);
    await callDataService(
      overview,
      onSuccess: (MomoContent response) {
        momo(response);
      },
      onError: ((dioError) {}),
    );
    debugPrint("${momo.value?.payUrl.toString()}");
    if (momo.value != null) {
      startTimer();
    }
  }

  Timer? timerMinutes;
  Timer? timerSeconds;
  var minutes = 9.obs;
  var seconds = 59.obs;

  void startTimer() {
    const onMinutes = Duration(minutes: 1);
    const onSeconds = Duration(seconds: 1);
    timerMinutes = Timer.periodic(onMinutes, (Timer timer) {
      if (minutes == 0) {
        timer.cancel();
      } else {
        minutes--;
      }
    });
    timerSeconds = Timer.periodic(onSeconds, (Timer timer) {
      if (minutes == 0 && seconds == 0) {
        timer.cancel();
        momo.value = null;
      } else if (seconds == 0) {
        seconds = 59.obs;
      } else {
        seconds--;
      }

      // debugPrint("${minutes.toInt()}:${seconds.toInt()}");
    });
  }
}
