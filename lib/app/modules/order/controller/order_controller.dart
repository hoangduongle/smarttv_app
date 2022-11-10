// ignore_for_file: await_only_futures, unused_local_variable
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/order_content.dart';
import 'package:smarttv_app/app/core/model/order_detail_content.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class OrderController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());

  Rx<List<OrderDetailContent>> orderDetails = Rx<List<OrderDetailContent>>([]);
  Rx<OrderContent?> order = Rx<OrderContent?>(null);
  int result = 0;

  @override
  void onInit() async {
    final prefs = await SharedPreferences.getInstance();
    var orderId = await prefs.getInt("orderId");
    await fetchOrderDetails(orderId ?? 0);
    await fetchOrder(orderId ?? 0);
    super.onInit();
  }
  void reloadOrder() {}

  Future<void> fetchOrder(int orderId) async {
    var overview = _repository.getOrderById(orderId);
    await callDataService(
      overview,
      onSuccess: (OrderContent response) {
        order(response);
      },
      onError: ((dioError) {}),
    );
    var prefs = await SharedPreferences.getInstance();
    await prefs.setDouble("totalOrder", order.value?.totalAmount ?? 0);
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
    update();
  }
}
