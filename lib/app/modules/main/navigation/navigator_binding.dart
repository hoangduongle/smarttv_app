import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/main/navigation/navigator_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigatorController>(() => NavigatorController(),
        tag: (NavigatorController).toString(), fenix: true);
  }
}
