// ignore_for_file: prefer_const_constructors, constant_identifier_names

import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/bill/binding/bill_binding.dart';
import 'package:smarttv_app/app/modules/bill/view/bill_screen.dart';
import 'package:smarttv_app/app/modules/cart/binding/cart_bindings.dart';
import 'package:smarttv_app/app/modules/cart/view/cart_screen.dart';
import 'package:smarttv_app/app/modules/event/binding/event_binding.dart';
import 'package:smarttv_app/app/modules/event/view/event_screen.dart';
import 'package:smarttv_app/app/modules/foodandbeverage/binding/foodandbeverage_binding.dart';
import 'package:smarttv_app/app/modules/foodandbeverage/view/fandb_screen.dart';
import 'package:smarttv_app/app/modules/local/binding/local_binding.dart';
import 'package:smarttv_app/app/modules/local/view/local_screen.dart';
import 'package:smarttv_app/app/modules/main/binding/main_binding.dart';
import 'package:smarttv_app/app/modules/main/view/main_screen.dart';
import 'package:smarttv_app/app/modules/service_components/binding/list_service_binding.dart';
import 'package:smarttv_app/app/modules/service_components/view/list_service_screen.dart';
import 'package:smarttv_app/app/modules/welcome/binding/wellcome_binding.dart';
import 'package:smarttv_app/app/modules/welcome/birthday/birthday_screen.dart';
import 'package:smarttv_app/app/modules/welcome/view/wellcome_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;

  static final routes = [
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
      name: _Paths.BIRTHDAY,
      page: () => Birthday(),
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
      name: _Paths.LOCAL,
      page: () => LocalScreen(),
      binding: LocalBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.BILL,
      page: () => BillScreen(),
      binding: BillBinding(),
      transition: Transition.noTransition,
    ),
  ];
}
