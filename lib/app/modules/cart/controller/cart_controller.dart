// ignore_for_file: unnecessary_null_comparison, unused_local_variable, unrelated_type_equality_checks, await_only_futures, unused_import, prefer_typing_uninitialized_variables

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/booking_content.dart';
import 'package:smarttv_app/app/core/model/orderRequest.dart';
import 'package:smarttv_app/app/core/model/order_content.dart';
import 'package:smarttv_app/app/core/model/order_detail_content.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/core/utils/date_time_utils.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';
import 'package:smarttv_app/app/modules/cart/widget/dialog.dart';
import 'package:smarttv_app/app/modules/order/binding/order_binding.dart';
import 'package:smarttv_app/app/modules/order/controller/order_controller.dart';
import 'package:smarttv_app/app/modules/main/view/main_screen.dart';
import 'package:smarttv_app/app/widget/loading.dart';
import 'package:smarttv_app/app/widget/loading_dialog.dart';

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
    Get.snackbar("", "",
        colorText: AppColors.white,
        borderRadius: 10.r,
        icon: const Icon(FluentIcons.cart_16_filled),
        messageText: Text(
          "Số lượng: $quantity",
          style: TextStyle(
              color: AppColors.white,
              fontSize: 15.r,
              fontWeight: FontWeight.normal),
        ),
        titleText: Text(
          "${serviceContent.name} đã thêm vào giỏ",
          style: TextStyle(
              color: AppColors.background,
              fontSize: 17.r,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.focus.withOpacity(.8),
        duration: const Duration(seconds: 2));
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

  Future<void> insertOrderdetails(OrderDetailContent orderDetailContent) async {
    var overview = _repository.insertOrderdetail(orderDetailContent);
    await callDataService(
      overview,
      onSuccess: (response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
  }

  Future<void> insertOrderRequest(OrderRequest orderRequest) async {
    var overview = _repository.insertOrderRequest(orderRequest);
    await callDataService(
      overview,
      onSuccess: (response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
  }

  void addNewOrder() async {
    try {
      if (_service.isNotEmpty) {
        const LoadingDialog().showLoadingDialog(Get.context!);
        List<LorderDetailRequests> listlorderDetailRequests = [];
        for (int i = 0; i < _service.length; i++) {
          ServiceContent serContent = _service.keys.toList()[i];
          int quantity = _service.values.toList()[i];
          LorderDetailRequests lorderDetailRequests = LorderDetailRequests(
            amount: (serContent.price! * quantity),
            id: 0,
            orderDate: DateTimeUtils.currentDate(),
            orderId: 0,
            price: serContent.price,
            quantity: quantity,
            serviceId: serContent.id,
          );
          listlorderDetailRequests.add(lorderDetailRequests);
        }
        var prefs = await SharedPreferences.getInstance();
        var bookingId = await prefs.getInt("bookingId");
        OrderRequest orderRequest = OrderRequest(
            bookingId: bookingId,
            createBy: "Duong",
            createDate: DateTimeUtils.currentDate(),
            id: 0,
            lastModifyBy: "Duong",
            lorderDetailRequests: listlorderDetailRequests,
            status: "0",
            totalAmount: total,
            updateDate: DateTimeUtils.currentDate());
        await insertOrderRequest(orderRequest);
        OrderController orderController = Get.find();
        orderController.onInit();
        Get.back();
        removeAllSerivce();
        const DialogCart().showThanksDialog(Get.context!);
        Future.delayed(const Duration(seconds: 2), () {
          Get.back();
          Get.back();
        });
      } else {
        Get.back();
      }
    } catch (e) {
      const DialogCart().showFailDialog(Get.context!);
    }
  }
}

/**
  void addtoBil() async {
    if (_service.isNotEmpty) {
      const LoadingDialog().showLoadingDialog(Get.context!);
      OrderController orderController = Get.find();
      int? orderId = orderController.searchOrderIdByStatus("0").id;
      double newTotal = 0;
      // debugPrint(DateTimeUtils.currentDate());
      if (orderId != 0) {
        for (int i = 0; i < _service.length; i++) {
          ServiceContent serContent = _service.keys.toList()[i];
          int quantity = _service.values.toList()[i];
          await insertOrderdetails(OrderDetailContent(
            amount: (serContent.price! * quantity),
            orderDate: DateTimeUtils.currentDate(),
            orderId: orderId,
            id: 0,
            price: serContent.price,
            quantity: quantity,
            service: serContent,
          ));

          newTotal += (serContent.price! * quantity);
          debugPrint(orderId.toString());
        }

        var prefs = await SharedPreferences.getInstance();
        double? totalOrder = await prefs.getDouble("totalOrder");
        newTotal += totalOrder!;
        var bookingId = await prefs.getInt("bookingId");

        // await insertOrder(OrderContent(
        //     booking: BookingContent(id: bookingId),
        //     id: orderId,
        //     createBy: "Duong",
        //     createDate: "",
        //     lastModifyBy: "Duong",
        //     totalAmount: newTotal,
        //     status: "1",
        //     updateDate: DateTimeUtils.currentDate()));
        orderController.onInit();
        Get.back();
        removeAllSerivce();
        const ThankCustomer().showThanksDialog(Get.context!);
        Future.delayed(const Duration(seconds: 3), () {
          Get.back();
          Get.back();
        });
      }
    }
  }
  
 */