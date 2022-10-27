import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:smarttv_app/app/modules/checkout/controller/checkout_controller.dart';

class CheckoutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutController>(() => CheckoutController());
  }
}
