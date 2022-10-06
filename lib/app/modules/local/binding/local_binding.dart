import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/local/controller/local_controller.dart';

class LocalBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalController>(() => LocalController());
  }
}
