import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/bill/controller/bill_controller.dart';

class BillBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BillController>(() => BillController(),fenix: true);
  }
}
