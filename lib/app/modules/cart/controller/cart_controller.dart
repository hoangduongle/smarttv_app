// ignore_for_file: unnecessary_null_comparison, unused_local_variable, unrelated_type_equality_checks

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/order_detail_content.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/core/utils/date_time_utils.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';
import 'package:smarttv_app/app/modules/order/binding/order_binding.dart';
import 'package:smarttv_app/app/modules/order/controller/order_controller.dart';
import 'package:smarttv_app/app/modules/main/view/main_screen.dart';
import 'package:smarttv_app/app/widget/thankforusing.dart';

class CartController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  int? serviceId = 0;
  final _service = {}.obs;

  void addService(ServiceContent serviceContent, int quantity) {
    if (_service.containsKey(serviceContent)) {
      _service[serviceContent] += quantity;
    } else {
      _service[serviceContent] = quantity;
    }
    Get.snackbar(
        "${serviceContent.name} đã thêm vào giỏ", "số lượng: $quantity",
        colorText: AppColors.black,
        backgroundColor: AppColors.focus.withOpacity(.5),
        duration: const Duration(milliseconds: 1500));
  }

  void removeSerivce(ServiceContent serviceContent) {
    _service.remove(serviceContent);
  }

  void removeAllSerivce() {
    if (_service.isNotEmpty) _service.clear();
  }

  void updateService(ServiceContent serviceContent, int quantity) {
    if (quantity > 0) {
      _service[serviceContent] = quantity;
    } else {
      removeSerivce(serviceContent);
    }
  }

  get services => _service;
  get serviceSubtotal => _service.entries
      .map((service) => service.key.price * service.value)
      .toList();

  get total {
    String x;
    double y = 0;
    try {
      x = _service.entries
          .map((service) => service.key.price * service.value)
          .toList()
          .reduce((value, element) => value + element)
          .toString();
      y = double.parse(x);
    } catch (e) {
      y;
    }
    return y;
  }

  get sizeService => _service.keys.length;

  var result;

  // Future<void> insertBilldetails(BillDetailContent billDetailContent) async {
  //   var overview = _repository.insertBilldetail(billDetailContent);
  //   await callDataService(
  //     overview,
  //     onSuccess: (response) {
  //       result = response;
  //     },
  //     onError: ((dioError) {}),
  //   );
  // }

  void addtoBill() async {
    if (_service.isNotEmpty) {
      const ThankCustomer().showThanksDialog(Get.context!);
      // final prefs = await SharedPreferences.getInstance();
      // int? billId = prefs.getInt("billId");
      // if (billId != 0) {
      //   _service.forEach((key, value) async {
      //     await insertBilldetails(BillDetailContent(
      //         amount: (key.price * value),
      //         billDate: DateTimeUtils.currentDate(),
      //         billId: billId,
      //         id: 0,
      //         price: key.price,
      //         quantity: value,
      //         service: key,
      //         status: 1));
      //   });
      // }

      //   if (result == 200) {
      //     removeAllSerivce();
      //     Get.back();
      //     final prefs = await SharedPreferences.getInstance();
      //     int billId = prefs.getInt("billId") ?? 0;
      //     BillController().fetchBillDetails(billId);
      //     BillController().fetchBill(billId);
      //   } else {
      //     debugPrint("Update bill fail");
      //   }
      // } else {
      //   debugPrint("Cart is Empty!!!");
    }
  }
}
