import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/alarm/controller/alarm_controller.dart';

class AlarmBinding implements Bindings {
  @override
  void dependencies() {
    
    Get.lazyPut<AlarmController>(() => AlarmController());
  }
}
