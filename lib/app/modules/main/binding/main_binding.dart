import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/bill/binding/bill_binding.dart';
import 'package:smarttv_app/app/modules/event/binding/event_binding.dart';
import 'package:smarttv_app/app/modules/home/binding/home_binding.dart';
import 'package:smarttv_app/app/modules/main/controller/main_controller.dart';
import 'package:smarttv_app/app/modules/service/binding/service_binding.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    HomeBinding().dependencies();
    ServiceBinding().dependencies();
    BillBinding().dependencies();
    EventBinding().dependencies();
  }
}
