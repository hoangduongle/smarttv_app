import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/feedback/controller/feedback_controller.dart';

class FeedbackBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeedbackController>(() => FeedbackController());
  }
}
