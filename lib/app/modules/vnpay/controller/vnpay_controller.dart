// import 'package:get/get.dart';
// ignore_for_file: unused_field

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/order_content.dart';
import 'package:smarttv_app/app/core/model/vnpay.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';
import 'package:smarttv_app/app/modules/order/controller/order_controller.dart';

class VNPayController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  Rx<VNPayContent?> vnPay = Rx<VNPayContent?>(null);

  void createOrder(int orderId) {
    OrderController orderController = Get.find();
    OrderContent orderContent = orderController.findOrder(orderId);
    double amount = orderContent.totalAmount!.toDouble();
    vnPay = Rx<VNPayContent?>(null);
    fetchPaymentVnpay(orderId, amount);
    update();
  }

  Future<void> fetchPaymentVnpay(int orderId, double amount) async {
    var overview = _repository.vnPayPayment(orderId, amount);
    await callDataService(
      overview,
      onSuccess: (VNPayContent response) {
        debugPrint("VNpay url:${response.url}");
        vnPay(response);
      },
      onError: ((dioError) {}),
    );
  }
}
