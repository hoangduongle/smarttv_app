import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/order/controller/order_controller.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(() => OrderController(),fenix: true);
  }
}
