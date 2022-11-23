// ignore_for_file: await_only_futures, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/orderRequest.dart';
import 'package:smarttv_app/app/core/model/order_content.dart';
import 'package:smarttv_app/app/core/model/order_detail_content.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/core/utils/date_time_utils.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';
import 'package:smarttv_app/app/modules/order/controller/order_controller.dart';
import 'package:smarttv_app/app/modules/taxi/widget/taxi_dialog.dart';
import 'package:smarttv_app/app/widget/loading_dialog.dart';

class TaxiController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  Rx<List<ServiceContent>> taxiContent = Rx<List<ServiceContent>>([]);
  List<bool> statusTaxi = [false, false];

  bool checkbox = false;

  @override
  void onInit() async {
    fetchServiceTaxi(4);
    checkTaxiService();
    super.onInit();
  }

  Future<void> orderService(ServiceContent service, int index) async {
    Get.back();
    const LoadingDialog().showLoadingDialog(Get.context!);
    bool flagCheck = false;
    for (int i = 0; i < statusTaxi.length; i++) {
      if (statusTaxi[i]) {
        flagCheck = true;
        Future.delayed(const Duration(seconds: 2), () {
          Get.back();
          const TaxiDialog().showTaxiExistDialog(Get.context!, index, service);
        });

        break;
      }
    }
    if (!flagCheck) {
      List<LorderDetailRequests> listlorderDetailRequests = [];
      listlorderDetailRequests.add(LorderDetailRequests(
        amount: (service.price!),
        id: 0,
        orderDate: DateTimeUtils.currentDate(),
        orderId: 0,
        price: service.price,
        quantity: 1,
        serviceId: service.id,
      ));
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
          totalAmount: service.price,
          updateDate: DateTimeUtils.currentDate());
      statusTaxi[index] = true;
      await insertOrderRequest(orderRequest);
      OrderController orderController = Get.find();
      orderController.onInit();
      Get.back();
      const TaxiDialog().showSuccessDialog(Get.context!);
    }
  }

  Future<void> insertOrderRequest(OrderRequest orderRequest) async {
    var overview = _repository.insertOrderRequest(orderRequest);
    int result = 0;
    await callDataService(
      overview,
      onSuccess: (response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
  }

  Rx<List<OrderDetailContent>> orderDetails = Rx<List<OrderDetailContent>>([]);
  Rx<List<OrderContent>> ordersForTaxi = Rx<List<OrderContent>>([]);

  Future<void> checkTaxiService() async {
    bool flagBreak = false;
    final prefs = await SharedPreferences.getInstance();
    var bookingId = prefs.getInt("bookingId");

    await fetchOrder(bookingId!.toInt());
    if (ordersForTaxi.value.isNotEmpty) {
      for (int i = 0; i < ordersForTaxi.value.length; i++) {
        await fetchOrderDetails(ordersForTaxi.value[i].id!);
        for (int j = 0; j < orderDetails.value.length; j++) {
          if (orderDetails.value[j].service!.id == 57) {
            // debugPrint(orderDetails.value[j].toString());
            statusTaxi[0] = true;
            flagBreak = true;
          } else if (orderDetails.value[j].service!.id == 58) {
            // debugPrint(orderDetails.value[j].toString());
            statusTaxi[1] = true;
            flagBreak = true;
          }
        }
        if (flagBreak) {
          // debugPrint("${statusTaxi}");
          break;
        }
      }
    }
  }

  Future<void> fetchOrder(int bookingId) async {
    var overview = _repository.getOrderByBookingId(bookingId);
    List<OrderContent> result = [];
    await callDataService(
      overview,
      onSuccess: (List<OrderContent> response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    ordersForTaxi(result);
  }

  Future<void> fetchOrderDetails(int orderId) async {
    var overview = _repository.getOrderdetailByOrderId(orderId);
    List<OrderDetailContent> result = [];
    await callDataService(
      overview,
      onSuccess: (List<OrderDetailContent> response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    orderDetails(result);
  }

  Future<void> fetchServiceTaxi(int serivceCategoryId) async {
    var overview = _repository.getListServiceContentByCateId(serivceCategoryId);
    List<ServiceContent> result = [];

    await callDataService(
      overview,
      onSuccess: (List<ServiceContent> response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    taxiContent(result);
    debugPrint("Taxi ${DateTimeUtils.currentDateTimeSecond()}");
  }
}
