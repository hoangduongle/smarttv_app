import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/turndown/controller/turndown_controller.dart';

class TurndownBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TurndownController>(() => TurndownController());
  }
}
