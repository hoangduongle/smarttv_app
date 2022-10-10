// ignore_for_file: unnecessary_null_comparison, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/bill_content.dart';
import 'package:smarttv_app/app/core/model/bill_detail_content.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/core/utils/date_time_utils.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';

class CartController extends BaseController {
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
        backgroundColor: AppColors.focus.withOpacity(.6),
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

  void addtoBill() {
    var cart = GetStorage();
    //length: services.length
    //serviceContent: services.keys.toList()[index]
    //quantity: services.values.toList()[index]

    //check cart empty or not
    if (_service.isNotEmpty) {
      //Call Api to Get Bill Id
      List<BillDetailContent> listCart = [];
      int billId = 1;
      cart.writeInMemory('cart', _service);
      removeAllSerivce();
    } else {
      debugPrint("Cart is Empty!!!");
    }
  }

  void fetchApi() async {}
}
/*
void addtoBill() {
    var cart = GetStorage();



    if (_service.isNotEmpty) {

      List<BillDetailContent> listCart = [];
      int billId = 1;

      for (int i = 0; i < services.length; i++) {
        ServiceContent serviceContent = services.keys.toList()[i];
        int quantity = services.values.toList()[i];
        double price = serviceContent.price!;
        BillDetailContent billdetailContent = BillDetailContent(
          billId: billId.toString(),
          serviceContent: services.keys.toList()[i],
          price: price,
          quantity: services.values.toList()[i],
          amount: price * quantity,
          billDate: DateTimeUtils.currentDate(),
          status: false,
        );
        listCart.add(billdetailContent);
        cart.writeInMemory('cart', listCart);
        removeAllSerivce();
      }
    } else {
      debugPrint("Cart is Empty!!!");
    }
  }

 */