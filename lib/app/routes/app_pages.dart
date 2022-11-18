// ignore_for_file: prefer_const_constructors, constant_identifier_names

import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/momo/binding/momo_binding.dart';
import 'package:smarttv_app/app/modules/momo/controller/momo_controller.dart';
import 'package:smarttv_app/app/modules/momo/view/momo_screen.dart';
import 'package:smarttv_app/app/modules/order/binding/order_binding.dart';
import 'package:smarttv_app/app/modules/cart/binding/cart_bindings.dart';
import 'package:smarttv_app/app/modules/cart/view/cart_screen.dart';
import 'package:smarttv_app/app/modules/event/binding/event_binding.dart';
import 'package:smarttv_app/app/modules/event/view/event_screen.dart';
import 'package:smarttv_app/app/modules/feedback/binding/feedback_binding.dart';
import 'package:smarttv_app/app/modules/feedback/view/feedback_screen.dart';
import 'package:smarttv_app/app/modules/foodandbeverage/binding/foodandbeverage_binding.dart';
import 'package:smarttv_app/app/modules/foodandbeverage/view/fandb_screen.dart';
import 'package:smarttv_app/app/modules/abtraction/binding/abtraction_binding.dart';
import 'package:smarttv_app/app/modules/abtraction/view/abtraction_screen.dart';
import 'package:smarttv_app/app/modules/main/binding/main_binding.dart';
import 'package:smarttv_app/app/modules/main/view/main_screen.dart';
import 'package:smarttv_app/app/modules/order/view/order_main_screen.dart';
import 'package:smarttv_app/app/modules/service_components/binding/list_service_binding.dart';
import 'package:smarttv_app/app/modules/service_components/view/list_service_screen.dart';
import 'package:smarttv_app/app/modules/splash/bindings/splash_binding.dart';
import 'package:smarttv_app/app/modules/splash/views/splash_view.dart';
import 'package:smarttv_app/app/modules/welcome/binding/wellcome_binding.dart';

import 'package:smarttv_app/app/modules/welcome/view/wellcome_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomePage(),
      binding: WellconeBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainScreen(),
      binding: MainBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.SERVICE_COMPONENT,
      page: () => ListServiceScreen(cateName: Get.parameters['cateName']!),
      binding: ListServiceBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.FANDB,
      page: () => FandBScreen(),
      binding: FoodandBeverageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartScreen(),
      binding: CartBinding(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: _Paths.EVENT,
      page: () => EventScreen(),
      binding: EventBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.ABTRACTION,
      page: () => AbtractionScreen(),
      binding: AbtractionBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => OrderMainScreen(),
      binding: OrderBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.FEEDBACK,
      page: () => FeedbackScreen(),
      binding: FeedbackBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.MOMO,
      page: () => MomoScreen(),
      binding: MomoBinding(),
      transition: Transition.noTransition,
    ),
  ];
}
