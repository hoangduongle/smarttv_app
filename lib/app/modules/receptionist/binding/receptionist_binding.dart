import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/receptionist/controller/receptionist_controller.dart';

class ReceptionistBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReceptionistController>(() => ReceptionistController());
  }
}
