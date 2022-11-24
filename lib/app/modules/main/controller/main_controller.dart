// ignore_for_file: unrelated_type_equality_checks, unused_import, unused_field, await_only_futures
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/dio/dio_token_manager.dart';
import 'package:smarttv_app/app/core/model/message_content.dart';
import 'package:smarttv_app/app/core/model/service_category_content.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';
import 'package:smarttv_app/app/modules/abtraction/controller/abtraction_controller.dart';
import 'package:smarttv_app/app/modules/event/controller/event_controller.dart';
import 'package:smarttv_app/app/modules/foodandbeverage/controller/foodandbeverage_controller.dart';
import 'package:smarttv_app/app/modules/home/controller/home_controller.dart';
import 'package:smarttv_app/app/modules/notification/controller/notification_controller.dart';
import 'package:smarttv_app/app/modules/order/controller/order_controller.dart';
import 'package:smarttv_app/app/modules/promotion/controller/promotion_controller.dart';
import 'package:smarttv_app/app/modules/service/controller/service_controller.dart';
import 'package:smarttv_app/app/modules/taxi/controller/taxi_controller.dart';

class MainController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());

  late Timer _timer;
  var formattedTime = "".obs;

  get currentTime => formattedTime;

  @override
  void onInit() {
    timing();
    super.onInit();
  }

  void timing() {
    _timer = Timer.periodic(
      const Duration(milliseconds: 500),
      (timer) {
        Intl.defaultLocale = 'en_US';
        initializeDateFormatting();
        formattedTime = DateFormat('hh:mm a').format(DateTime.now()).obs;
        if (DateTime.now().minute == 30 && DateTime.now().second == 1) {
          debugPrint("${DateTime.now().minute}:${DateTime.now().second}");
          // debugPrint("Time to refesh fetch Api");
          // fetchAllApi();
        } else {
          if ((DateTime.now().minute == 10 && DateTime.now().second == 1) ||
              (DateTime.now().minute == 20 && DateTime.now().second == 1) ||
              (DateTime.now().minute == 30 && DateTime.now().second == 1) ||
              (DateTime.now().minute == 40 && DateTime.now().second == 1) ||
              (DateTime.now().minute == 50 && DateTime.now().second == 1) ||
              (DateTime.now().minute == 00 && DateTime.now().second == 1)) {
            if (!TokenManager.instance.hasToken) {
              TokenManager.instance.init();
            }
          }
        }
        update();
      },
    );
  }

  void loadingDialog() {
    Get.dialog(
      Dialog(
        elevation: 100,
        backgroundColor: AppColors.transparent,
        child: WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: Center(
            child: SizedBox(
              width: double.infinity.w,
              height: double.infinity.w,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset("assets/lotties/loadingImage.json", width: 150),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void fetchAllApi() async {
    debugPrint("Refesh fetch Api");
    loadingDialog();
    OrderController orderController = Get.find();
    orderController.onInit();

    // FoodandBeverageController foodandBeverageController = Get.find();
    // foodandBeverageController.onInit();

    // ServiceController serviceController = Get.find();
    // serviceController.onInit();

    EventController eventController = Get.find();
    eventController.onInit();

    PromotionController promotionController = Get.find();
    promotionController.onInit();

    AbtractionController abtractionController = Get.find();
    abtractionController.onInit();

    Future.delayed(
      const Duration(seconds: 5),
      () => Get.back(),
    );
  }
}
  // var language = "vietnamese".obs;
  // void switchLanguage() {
  //   if (isSwitch) {
  //     Get.updateLocale(const Locale('vi', 'Vi'));
  //     language = "english".obs;
  //   } else {
  //     Get.updateLocale(const Locale('en', 'US'));
  //     language = "vietnamese".obs;
  //   }
  // }
  //  bool isSwitch = false;