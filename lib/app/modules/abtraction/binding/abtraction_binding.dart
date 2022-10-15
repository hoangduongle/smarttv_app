import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/abtraction/controller/abtraction_controller.dart';

class AbtractionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AbtractionController>(() => AbtractionController());
  }
}
