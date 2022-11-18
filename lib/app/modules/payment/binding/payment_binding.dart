import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/payment/controller/payment_controller.dart';

class PaymentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentController>(() => PaymentController());
  }
}
