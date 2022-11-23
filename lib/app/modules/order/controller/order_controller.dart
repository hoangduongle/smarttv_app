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
  Rx<List<OrderContent>> orders = Rx<List<OrderContent>>([]);
  Rx<OrderPaymentContent?> orderPayment = Rx<OrderPaymentContent?>(null);

  int result = 0;
  OrderContent findOrder(int id) =>
      orders.value.firstWhere((order) => order.id == id);

  get total {
    String x;
    double y = 0;
    try {
      for (int i = 0; i < orders.value.length; i++) {
        if (orders.value[i].status == "0") {
          y += orders.value[i].totalAmount!;
        }
      }
    } catch (e) {
      y;
    }
    return y;
  }

  get isPayall {
    bool x = true;
    try {
      for (int i = 0; i < orders.value.length; i++) {
        if (orders.value[i].status == "0") {
          x = false;
          break;
        }
      }
    } catch (e) {
      x;
    }
    return x;
  }

  double getOrderTotal(int id) {
    double result = 0;
    for (var element in orders.value) {
      if (element.id == id) {
        result = element.totalAmount!;
      }
    }
    return result;
  }

  OrderContent searchOrderIdByStatus(String status) {
    //0 pay 1 unpay
    OrderContent result = OrderContent();
    for (int i = 0; i < orders.value.length; i++) {
      if (orders.value[i].status == status) {
        result = orders.value[i];
      }
    }
    return result;
  }

  bool getStatusByOrderId(int orderId) {
    bool result = false;
    for (int i = 0; i < orders.value.length; i++) {
      if (orders.value[i].id == orderId) {
        if (orders.value[i].status == "1") {
          result = true;
        }
      }
    }
    return result;
  }

  @override
  void onInit() async {
    final prefs = await SharedPreferences.getInstance();
    var bookingId = await prefs.getInt("bookingId");
    fetchOrder(bookingId ?? 0);
    super.onInit();
  }

  Stream<List<OrderContent>> ordersStream() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: SECONDS));
      final prefs = await SharedPreferences.getInstance();
      var bookingId = await prefs.getInt("bookingId");
      List<OrderContent> events = await fetchOrder(bookingId!);
      yield events;
    }
  }

  Future<void> fetchOrderPayment(int orderId) async {
    var overview = _repository.getOrderPaymentByOrderId(orderId);
    await callDataService(
      overview,
      onSuccess: (OrderPaymentContent response) {
        orderPayment(response);
      },
      onError: ((dioError) {}),
    );
  }

  void loadOrderdetails(int orderId) async {
    orderDetails.value.clear();
    Future.wait({
      fetchOrderDetails(orderId),
    }); //fetchOrderPayment(orderId)
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
    orders(result);
    double total = searchOrderIdByStatus("0").totalAmount ?? 0;
    var prefs = await SharedPreferences.getInstance();
    await prefs.setDouble("totalOrder", total); //
    if (orders.value.length <= 1) {
      fetchOrderDetails(orders.value.first.id!);
    }
    debugPrint("Order ${DateTimeUtils.currentDateTimeSecond()}");
    update();
    return result;
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
