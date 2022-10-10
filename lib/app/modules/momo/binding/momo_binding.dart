import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/momo/controller/momo_controller.dart';

class MomoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MomoController>(() => MomoController());
  }
}
