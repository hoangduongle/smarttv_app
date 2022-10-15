import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/promotion/controller/promotion_controller.dart';

class PromotionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PromotionController>(() => PromotionController());
  }
}
