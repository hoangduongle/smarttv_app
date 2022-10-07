import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/main/controller/main_controller.dart';


class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
  }
}
