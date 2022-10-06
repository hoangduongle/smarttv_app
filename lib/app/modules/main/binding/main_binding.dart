import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/bill/binding/bill_binding.dart';
import 'package:smarttv_app/app/modules/cart/binding/cart_bindings.dart';
import 'package:smarttv_app/app/modules/event/binding/event_binding.dart';
import 'package:smarttv_app/app/modules/home/binding/home_binding.dart';
import 'package:smarttv_app/app/modules/local/binding/local_binding.dart';
import 'package:smarttv_app/app/modules/main/controller/main_controller.dart';
import 'package:smarttv_app/app/modules/service/binding/service_binding.dart';
import 'package:smarttv_app/app/modules/service_components/binding/list_service_binding.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    HomeBinding().dependencies();
    ServiceBinding().dependencies();
    ListServiceBinding().dependencies();
    CartBinding().dependencies();
    EventBinding().dependencies();
    LocalBinding().dependencies();
    BillBinding().dependencies();
  }
}
