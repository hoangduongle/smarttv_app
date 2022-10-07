import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/notification/controller/notification_controller.dart';

class NotificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(() => NotificationController());
  }
}
