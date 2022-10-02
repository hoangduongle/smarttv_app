import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/welcome/controller/wellcome_controller.dart';

class WellconeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WellcomeController>(() => WellcomeController());
  }
}
