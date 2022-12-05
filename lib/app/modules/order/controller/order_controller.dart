// ignore_for_file: await_only_futures, unused_local_variable
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/order_content.dart';
import 'package:smarttv_app/app/core/model/order_detail_content.dart';
import 'package:smarttv_app/app/core/model/order_payment_content.dart';
import 'package:smarttv_app/app/core/utils/date_time_utils.dart';
import 'package:smarttv_app/app/data/data.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class OrderController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());

  Rx<List<OrderDetailContent>> orderDetails = Rx<List<OrderDetailContent>>([]);
  Rx<List<OrderContent>> ordersTMP = Rx<List<OrderContent>>([]);
  Rx<List<OrderContent>> orders = Rx<List<OrderContent>>([]);
  Rx<OrderPaymentContent?> orderPayment = Rx<OrderPaymentContent?>(null);

  int result = 0;
  OrderContent findOrder(int id) =>
      orders.value.firstWhere((order) => order.id == id);

  double getOrderTotal(int id) {
    double result = 0;
    for (var element in orders.value) {
      if (element.id == id) {
        result = element.totalAmount!;
      }
    }
    return result;
  }

  List<String> getAllOrderIdNotPay() {
    List<String> listOrderId = [];
    for (int i = 0; i < orders.value.length; i++) {
      if (orders.value[i].orderPayment == null) {
        listOrderId.add(orders.value[i].id.toString());
      }
    }
    return listOrderId;
  }

  String getPaymentMethodByOrderId(int orderId) {
    for (int i = 0; i < orders.value.length; i++) {
      if (orders.value[i].id == orderId) {
        return orders.value[i].orderPayment!.paymentMethod!.method.toString();
      }
    }
    return "";
  }

  bool getOrderPaymentByOrderId(int orderId) {
    bool result = false;
    for (int i = 0; i < orders.value.length; i++) {
      if (orders.value[i].id == orderId) {
        if (orders.value[i].orderPayment != null) {
          //co orderPayment
          result = true;
        }
      }
    }
    return result;
  }

  @override
  Future<void> onInit() async {
    final prefs = await SharedPreferences.getInstance();
    var bookingId = await prefs.getInt(bookId);
    fetchOrder(bookingId ?? 0);
    super.onInit();
  }

  Future<void> reload() async {
    onInit();
  }

  void loadOrderdetails(int orderId) async {
    orderDetails.value.clear();
    fetchOrderDetails(orderId);
    Future.wait({}); //fetchOrderPayment(orderId)
  }

  Future<List<OrderContent>> fetchOrder(int bookingId) async {
    var overview = _repository.getOrderByBookingId(bookingId);
    List<OrderContent> result = [];
    await callDataService(
      overview,
      onSuccess: (List<OrderContent> response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    ordersTMP(result);
    filterStatusDONE();
    debugPrint("Order ${DateTimeUtils.currentDateTimeSecond()}");

    update();
    return result;
  }

  void filterStatusDONE() {
    if (orders.value.isNotEmpty) {
      orders.value.clear();
    }
    for (int i = 0; i < ordersTMP.value.length; i++) {
      if (ordersTMP.value[i].status == "DONE") {
        orders.value.add(ordersTMP.value[i]);
      }
    }
    orders.value.sort(
      (a, b) => a.orderPayment != null ? 1 : 0,
    );

    // debugPrint("Orderrr: ${orders.value.toString()}");
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
    update();
  }

  get isPayall {
    bool x = false;
    try {
      for (int i = 0; i < orders.value.length; i++) {
        if (orders.value[i].orderPayment == null) {
          x = true;
          break;
        }
      }
    } catch (e) {
      x;
    }
    return x;
  }

  get total {
    String x;
    double y = 0;
    try {
      for (int i = 0; i < orders.value.length; i++) {
        if (orders.value[i].orderPayment == null) {
          y += orders.value[i].totalAmount!;
        }
      }
    } catch (e) {
      y;
    }
    return y;
  }

  // Future<void> fetchinsertOrder(OrderContent orderContent) async {
  //   var overview = _repository.insertOrder(orderContent);
  //   int result = 0;
  //   await callDataService(
  //     overview,
  //     onSuccess: (int response) {
  //       result = response;
  //     },
  //     onError: ((dioError) {}),
  //   );
  //   update();
  // }
}
