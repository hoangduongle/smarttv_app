import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/foodandbeverage/controller/foodandbeverage_controller.dart';

class FoodandBeverageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoodandBeverageController>(() => FoodandBeverageController());
  }
}
