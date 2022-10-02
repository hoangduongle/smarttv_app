import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/service/controller/service_controller.dart';

class ServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceController>(() => ServiceController());
  }
}
