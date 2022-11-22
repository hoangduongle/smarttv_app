// ignore_for_file: unrelated_type_equality_checks, unused_local_variable

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/momo_content.dart';
import 'package:smarttv_app/app/core/model/order_content.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';
import 'package:smarttv_app/app/modules/momo/view/momo_screen.dart';
import 'package:smarttv_app/app/modules/order/controller/order_controller.dart';

class MomoController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  Rx<OrderContent?> order = Rx<OrderContent?>(null);

  Rx<MomoContent?> momo = Rx<MomoContent?>(null);

  void createOrder(int orderId) {
    momo = Rx<MomoContent?>(null);

    fetchPaymentMomo(orderId);
    update();
  }

  Timer? timerCheck;
  Future<void> fetchPaymentMomo(int orderId) async {
    var overview = _repository.momoPayment(orderId);
    await callDataService(
      overview,
      onSuccess: (MomoContent response) {
        debugPrint("${response.payUrl}");

        momo(response);
      },
      onError: ((dioError) {}),
    );

    timerCheck =
        Timer.periodic(const Duration(seconds: 5), (Timer timer) async {
      await queryOrder(orderId);
      if (order.value!.status == "1") {
        timerCheck?.cancel();
        debugPrint("MoMo onReady: ${order.value!.status}");
        Get.back();
        const MomoScreen().showThanksDialog(Get.context!);
        OrderController orderController = Get.find();
        orderController.onInit();
      }
    });
  }

  Future<void> queryOrder(int orderId) async {
    var overview = _repository.getOrderId(orderId);

    await callDataService(
      overview,
      onSuccess: (OrderContent response) {
        order(response);
      },
      onError: ((dioError) {}),
    );
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
    });
  }
}
