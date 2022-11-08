import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/abtraction/binding/abtraction_binding.dart';
import 'package:smarttv_app/app/modules/alarm/binding/alarm_binding.dart';
import 'package:smarttv_app/app/modules/order/binding/order_binding.dart';
import 'package:smarttv_app/app/modules/cart/binding/cart_bindings.dart';
import 'package:smarttv_app/app/modules/checkout/binding/checkout_binding.dart';
import 'package:smarttv_app/app/modules/event/binding/event_binding.dart';
import 'package:smarttv_app/app/modules/feedback/binding/feedback_binding.dart';
import 'package:smarttv_app/app/modules/foodandbeverage/binding/foodandbeverage_binding.dart';
import 'package:smarttv_app/app/modules/home/binding/home_binding.dart';
import 'package:smarttv_app/app/modules/main/controller/main_controller.dart';
import 'package:smarttv_app/app/modules/massage/binding/massage_binding.dart';
import 'package:smarttv_app/app/modules/momo/binding/momo_binding.dart';
import 'package:smarttv_app/app/modules/notification/binding/notification_binding.dart';
import 'package:smarttv_app/app/modules/pool/binding/pool_binding.dart';
import 'package:smarttv_app/app/modules/promotion/binding/promotion_binding.dart';

import 'package:smarttv_app/app/modules/service/binding/service_binding.dart';
import 'package:smarttv_app/app/modules/service_components/binding/list_service_binding.dart';
import 'package:smarttv_app/app/modules/taxi/binding/taxi_binding.dart';
import 'package:smarttv_app/app/modules/turndown/binding/turndown_binding.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
//=====================Navigator=================================
    HomeBinding().dependencies();
    ServiceBinding().dependencies();
    EventBinding().dependencies();
    AbtractionBinding().dependencies();
    PromotionBinding().dependencies();
    OrderBinding().dependencies();
    FeedbackBinding().dependencies();
//===============================================================
//===============================================================
//===============================================================
//===============================================================

    NotificationBinding().dependencies();

    ListServiceBinding().dependencies();
    FoodandBeverageBinding().dependencies();
    CartBinding().dependencies();

    MomoBinding().dependencies();
    PoolBinding().dependencies();
    TaxiBinding().dependencies();
    MassageBinding().dependencies();
    TurndownBinding().dependencies();
    CheckoutBinding().dependencies();
    AlarmBinding().dependencies();
  }
}
