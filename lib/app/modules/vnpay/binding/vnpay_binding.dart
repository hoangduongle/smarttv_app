import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/vnpay/controller/vnpay_controller.dart';

class VNPayBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VNPayController>(() => VNPayController());
  }
}
