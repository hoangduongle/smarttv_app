import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/massage/controller/massage_controller.dart';

class MassageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MassageController>(() => MassageController());
  }
}
