import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/pool/controller/pool_controller.dart';

class PoolBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PoolController>(() => PoolController());
  }
}
