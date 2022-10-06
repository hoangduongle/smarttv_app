import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/cart/controller/cart_controller.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController(),fenix: true,tag: CartController().toString());
  }
}
