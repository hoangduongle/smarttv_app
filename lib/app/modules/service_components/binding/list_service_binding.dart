
import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/service_components/controller/list_service_controller.dart';

class ListServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListServiceController>(() => ListServiceController());
  }
}
