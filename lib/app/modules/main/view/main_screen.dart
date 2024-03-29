// ignore_for_file: dead_code, prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, avoid_print, unused_field, unused_local_variable, non_constant_identifier_names, unrelated_type_equality_checks
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/abtraction/controller/abtraction_controller.dart';
import 'package:smarttv_app/app/modules/alarm/view/alarm_screen.dart';
import 'package:smarttv_app/app/modules/event/controller/event_controller.dart';
import 'package:smarttv_app/app/modules/home/controller/home_controller.dart';
import 'package:smarttv_app/app/modules/notification/controller/notification_controller.dart';
import 'package:smarttv_app/app/modules/notification/view/notification_screen.dart';
import 'package:smarttv_app/app/modules/cart/controller/cart_controller.dart';
import 'package:smarttv_app/app/modules/checkout/view/checkout_screen.dart';
import 'package:smarttv_app/app/modules/event/view/event_screen.dart';
import 'package:smarttv_app/app/modules/feedback/view/feedback_screen.dart';
import 'package:smarttv_app/app/modules/home/view/home_screen.dart';
import 'package:smarttv_app/app/modules/abtraction/view/abtraction_screen.dart';
import 'package:smarttv_app/app/modules/main/controller/main_controller.dart';
import 'package:smarttv_app/app/modules/navigation/controller/navigator_controller.dart';
import 'package:smarttv_app/app/modules/navigation/widget/widget_navigationslider.dart';
import 'package:smarttv_app/app/modules/massage/view/massage_screen.dart';
import 'package:smarttv_app/app/modules/order/controller/order_controller.dart';
import 'package:smarttv_app/app/modules/order/view/list_order_screen.dart';
import 'package:smarttv_app/app/modules/order/view/order_screen.dart';
import 'package:smarttv_app/app/modules/pool/view/pool_screen.dart';
import 'package:smarttv_app/app/modules/promotion/controller/promotion_controller.dart';
import 'package:smarttv_app/app/modules/promotion/view/promotion_screen.dart';
import 'package:smarttv_app/app/modules/service/controller/service_controller.dart';
import 'package:smarttv_app/app/modules/service/view/service_screen.dart';
import 'package:smarttv_app/app/core/values/app_assets.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_const.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smarttv_app/app/modules/taxi/view/taxi_screen.dart';
import 'package:smarttv_app/app/modules/turndown/view/turndown_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  NavigatorController naController =
      Get.find(tag: (NavigatorController).toString());
  bool waitonTap = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CartController Cacontroller = Get.find();
    NotificationController noController = Get.find();
    return WillPopScope(onWillPop: () async {
      bool result = false;

      if (naController.current_index.toInt() == 0) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "Thoát ứng dụng ?",
                style: TextStyle(
                  color: AppColors.title,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Text(
                "Bạn có muốn thoát ứng dụng không?",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: AppColors.navigabackground,
              actionsAlignment: MainAxisAlignment.center,
              elevation: 24,
              actions: [
                SizedBox(
                  width: 80.w,
                  height: 30.h,
                  child: Material(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(10.r),
                    elevation: 0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      autofocus: true,
                      focusColor: AppColors.greenFocus,
                      onTap: () {
                        Get.back();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Không',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                                color: AppColors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 80.w,
                  height: 30.h,
                  child: Material(
                    color: AppColors.title,
                    borderRadius: BorderRadius.circular(10.r),
                    elevation: 0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      focusColor: AppColors.orangeColor,
                      onTap: () {
                        SystemNavigator.pop();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Có',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                                color: AppColors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
        result = false;
      }
      if (naController.current_index.toInt() == 1 ||
          naController.current_index.toInt() == 2 ||
          naController.current_index.toInt() == 3 ||
          naController.current_index.toInt() == 4 ||
          naController.current_index.toInt() == 5 ||
          naController.current_index.toInt() == 6) {
        naController.current_index = 0.obs;
      }
      if (naController.current_index.toInt() == 7 ||
          naController.current_index.toInt() == 8 ||
          naController.current_index.toInt() == 9 ||
          naController.current_index.toInt() == 10 ||
          naController.current_index.toInt() == 11 ||
          naController.current_index.toInt() == 12) {
        naController.current_index = 1.obs;
      }
      if (naController.current_index.toInt() == 13) {
        naController.current_index = 5.obs;
      }
      return result;
    }, child: GetBuilder<MainController>(
      builder: (maController) {
        return Scaffold(
          floatingActionButton: Stack(
            children: [
              // Align(
              //   alignment: Alignment(0.5.w, -0.92.h),
              //   child: Material(
              //     color: AppColors.transparent,
              //     child: InkWell(
              //       borderRadius: BorderRadius.circular(100.r),
              //       focusColor: AppColors.orangeColor,
              //       onTap: () {
              //         maController.fetchAllApi();
              //       },
              //       child: Icon(
              //         Icons.refresh,
              //         size: 30.r,
              //         color: AppColors.white,
              //       ),
              //     ),
              //   ),
              // ),
              Stack(
                children: [
                  Align(
                    alignment: Alignment(0.72.w, -0.92.h),
                    child: Material(
                      color: AppColors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100.r),
                        focusColor: AppColors.orangeColor,
                        onTap: () {
                          NotificationScreen().showNotificationDialog(context);
                        },
                        child: Icon(
                          FluentIcons.alert_20_regular,
                          size: 30.r,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  noController.messages.value.isEmpty
                      ? Align()
                      : Align(
                          alignment: Alignment(0.721.w, -0.905.h), //0.74 -0.945
                          child: Container(
                            width: 12,
                            height: 9,
                            decoration: BoxDecoration(
                                color: AppColors.red,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: AppColors.background,
                                    width: 2,
                                    strokeAlign: StrokeAlign.center)),
                          ),
                        ),
                ],
              ),
              Align(
                  alignment: Alignment(0.95, -0.90),
                  child: Obx(
                    () {
                      return SizedBox(
                          height: 35.h,
                          child: Text(
                            maController.formattedTime.string,
                            style: TextStyle(
                                color: AppColors.white,
                                fontFamily: FontFamily.Arvo,
                                fontSize: 20.sp),
                          ));
                    },
                  )),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
          body: Row(
            children: <Widget>[
              AnimatedContainer(
                  width: naController.select
                      ? (size.width * 5 / 24).w
                      : (size.width * 1 / 16).w,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.fastOutSlowIn,
                  child: Container(
                    // node: navigaScope,
                    // autofocus: true,
                    // canRequestFocus: navigaScope.canRequestFocus,
                    // onKeyEvent: (node, event) {
                    //   if (event is KeyDownEvent) {
                    //     if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
                    //       setState(() {
                    //         // FocusScope.of(context).requestFocus(viewScope);
                    //         FocusScope.of(context).unfocus();
                    //       });
                    //     }
                    //   }
                    //   return KeyEventResult.ignored;
                    // },
                    child: Container(
                      color: AppColors.navigabackground,
                      child: Column(
                        children: [
                          Expanded(
                              child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 10.w,
                                ),
                                SizedBox(
                                    width: 40.w,
                                    child: Image(
                                      image: AssetImage(AppAssets.logo),
                                    )),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.0.w,
                                      vertical: (size.height * 0.02).h),
                                  child: Text(
                                    AppConstants.title,
                                    style: AppStyles.h5.copyWith(
                                        color: Colors.white,
                                        fontSize: (size.width * 0.022).sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          )),
                          Expanded(
                            flex: 6,
                            child: Container(
                              child: ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                  height: 15,
                                ),
                                itemCount: naController.navigation_list.length,
                                itemBuilder: (context, index) {
                                  return AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.fastOutSlowIn,
                                    padding: EdgeInsets.only(
                                      left: naController.select
                                          ? (size.width * 0.015).w
                                          : (size.width * 0).w,
                                      right: naController.select
                                          ? (size.width * 0.015).w
                                          : (size.width * 0).w,
                                    ),
                                    child: SizedBox(
                                      height: 50.h,
                                      child: Material(
                                        color: AppColors.navigabackground,
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          focusColor: AppColors.greyColor,
                                          autofocus: index == 0,
                                          onFocusChange: (value) {
                                            setState(() {
                                              naController.select = value;
                                            });
                                          },
                                          onTap: () {
                                            setState(() {
                                              naController.current_index =
                                                  index.obs;
                                              switch (index) {
                                                case 0:
                                                  if (waitonTap) {
                                                    waitonTap = false;
                                                    HomeController
                                                        homeController =
                                                        Get.find();
                                                    Future.wait([
                                                      homeController.reload(),
                                                    ]);
                                                    Future.delayed(
                                                      Duration(seconds: 1),
                                                      () {
                                                        waitonTap = true;
                                                      },
                                                    );
                                                  } else {
                                                    debugPrint(
                                                        "Wait for Service Category Load Api");
                                                  }
                                                  break;
                                                case 1:
                                                  if (waitonTap) {
                                                    waitonTap = false;
                                                    ServiceController
                                                        serviceController =
                                                        Get.find();
                                                    Future.wait([
                                                      serviceController
                                                          .reload(),
                                                    ]);
                                                    Future.delayed(
                                                      Duration(
                                                          seconds: AppConstants
                                                              .seconds_ServiceCate),
                                                      () {
                                                        waitonTap = true;
                                                      },
                                                    );
                                                  } else {
                                                    debugPrint(
                                                        "Wait for Service Category Load Api");
                                                  }
                                                  break;
                                                case 2:
                                                  if (waitonTap) {
                                                    waitonTap = false;
                                                    EventController
                                                        eventController =
                                                        Get.find();
                                                    Future.wait([
                                                      eventController.reload(),
                                                    ]);
                                                    Future.delayed(
                                                      Duration(
                                                          seconds: AppConstants
                                                              .seconds_ServiceCate),
                                                      () {
                                                        waitonTap = true;
                                                      },
                                                    );
                                                  } else {
                                                    debugPrint(
                                                        "Wait for Event Load Api");
                                                  }
                                                  break;
                                                case 3:
                                                  if (waitonTap) {
                                                    waitonTap = false;
                                                    AbtractionController
                                                        abtractionController =
                                                        Get.find();
                                                    Future.wait([
                                                      abtractionController
                                                          .reload(),
                                                    ]);
                                                    Future.delayed(
                                                      Duration(
                                                          seconds: AppConstants
                                                              .seconds_ServiceCate),
                                                      () {
                                                        waitonTap = true;
                                                      },
                                                    );
                                                  } else {
                                                    debugPrint(
                                                        "Wait for Abtraction Load Api");
                                                  }
                                                  break;
                                                case 4:
                                                  if (waitonTap) {
                                                    waitonTap = false;
                                                    PromotionController
                                                        promotionController =
                                                        Get.find();
                                                    Future.wait([
                                                      promotionController
                                                          .reload(),
                                                    ]);
                                                    Future.delayed(
                                                      Duration(
                                                          seconds: AppConstants
                                                              .seconds_ServiceCate),
                                                      () {
                                                        waitonTap = true;
                                                      },
                                                    );
                                                  } else {
                                                    debugPrint(
                                                        "Wait for Promotion Load Api");
                                                  }
                                                  break;
                                                case 5:
                                                  if (waitonTap) {
                                                    waitonTap = false;
                                                    OrderController
                                                        orderController =
                                                        Get.find();
                                                    Future.wait([
                                                      orderController.reload(),
                                                    ]);
                                                    Future.delayed(
                                                      Duration(
                                                          seconds: AppConstants
                                                              .seconds_ServiceCate),
                                                      () {
                                                        waitonTap = true;
                                                      },
                                                    );
                                                  } else {
                                                    debugPrint(
                                                        "Wait for Orders Load Api");
                                                  }
                                                  break;
                                                default:
                                              }
                                            });
                                          },
                                          child: BuildNavigation(
                                            index: naController.current_index
                                                .toInt(),
                                            title: naController
                                                .navigation_list[index].title,
                                            icons: naController
                                                .navigation_list[index]
                                                .iconData,
                                            iconSelected: naController
                                                .navigation_list[index]
                                                .iconSelectedData,
                                            active: index,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              Expanded(
                  child: Container(
                child: Container(
                  // node: viewScope,
                  // canRequestFocus: viewScope.canRequestFocus,
                  // onKeyEvent: (node, event) {
                  //   if (event is KeyDownEvent) {
                  //     if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
                  //       setState(() {
                  //         FocusScope.of(context).requestFocus(navigaScope);
                  //       });
                  //     }
                  //   }
                  //   return KeyEventResult.ignored;
                  // },
                  child: IndexedStack(
                    index: naController.current_index.toInt(),
                    children: [
                      ExcludeFocus(
                        //home
                        excluding: naController.current_index.toInt() == 0
                            ? false
                            : true,
                        child: HomePage(),
                      ),
                      ExcludeFocus(
                        //service

                        excluding: naController.current_index.toInt() == 1
                            ? false
                            : true,
                        child: ServiceScreen(),
                      ),
                      ExcludeFocus(
                        //event
                        excluding: naController.current_index.toInt() == 2
                            ? false
                            : true,
                        child: EventScreen(),
                      ),
                      ExcludeFocus(
                        //abtraction
                        excluding: naController.current_index.toInt() == 3
                            ? false
                            : true,
                        child: AbtractionScreen(),
                      ),
                      ExcludeFocus(
                          //promotion
                          excluding: naController.current_index.toInt() == 4
                              ? false
                              : true,
                          child: PromotionScreen()),
                      ExcludeFocus(
                        //order
                        excluding: naController.current_index.toInt() == 5
                            ? false
                            : true,
                        child: ListOrderScreen(),
                      ),
                      ExcludeFocus(
                          //feedback
                          excluding: naController.current_index.toInt() == 6
                              ? false
                              : true,
                          child: FeedbackScreen()),
                      //=================================================
                      ExcludeFocus(
                          //pool
                          excluding: naController.current_index.toInt() == 7
                              ? false
                              : true,
                          child: PoolScreen()),
                      ExcludeFocus(
                          //taxi
                          excluding: naController.current_index.toInt() == 8
                              ? false
                              : true,
                          child: TaxiScreen()),
                      ExcludeFocus(
                          //massage
                          excluding: naController.current_index.toInt() == 9
                              ? false
                              : true,
                          child: MassageScreen()),
                      ExcludeFocus(
                          //turndown
                          excluding: naController.current_index.toInt() == 10
                              ? false
                              : true,
                          child: TurndownScreen()),
                      ExcludeFocus(
                          //checkout
                          excluding: naController.current_index.toInt() == 11
                              ? false
                              : true,
                          child: CheckoutScreen()),
                      ExcludeFocus(
                          //alarm
                          excluding: naController.current_index.toInt() == 12
                              ? false
                              : true,
                          child: AlarmScreen()),
                      ExcludeFocus(
                          //order
                          excluding: naController.current_index.toInt() == 13
                              ? false
                              : true,
                          child: OrderScreen()),
                      //OrderScreen()
                    ],
                  ),
                ),
              )),
            ],
          ),
        );
      },
    ));
  }
}
