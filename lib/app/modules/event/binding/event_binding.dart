import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/event/controller/event_controller.dart';

class EventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventController>(() => EventController());
  }
}
