import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/taxi/controller/taxi_controller.dart';

class TaxiBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaxiController>(() => TaxiController());
  }
}
