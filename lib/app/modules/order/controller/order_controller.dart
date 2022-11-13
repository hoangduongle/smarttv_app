// ignore_for_file: await_only_futures, unused_local_variable
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/order_content.dart';
import 'package:smarttv_app/app/core/model/order_detail_content.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class OrderController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());

  Rx<List<OrderDetailContent>> orderDetails = Rx<List<OrderDetailContent>>([]);
  Rx<List<OrderContent>> orders = Rx<List<OrderContent>>([]);
  int result = 0;

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
    // debugPrint(orders.value.toList().toString());
    for (int i = 0; i < orders.value.length; i++) {
      if (orders.value[i].status == status) {
        debugPrint(orders.value[i].id.toString());
        result = orders.value[i];
      }
    }

    return result;
  }

  @override
  void onInit() async {
    final prefs = await SharedPreferences.getInstance();
    var bookingId = await prefs.getInt("bookingId");
    await fetchOrder(bookingId ?? 0);
    super.onInit();
  }

  void loadOrderdetails(int orderId) async {
    await fetchOrderDetails(orderId);
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
    orders(result);

    double total = searchOrderIdByStatus("1").totalAmount ?? 0;
    var prefs = await SharedPreferences.getInstance();

    await prefs.setDouble("totalOrder", total); //
    debugPrint("Order new Total: $total");
    update();
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
    debugPrint(orderDetails.toString());
    update();
  }
}
