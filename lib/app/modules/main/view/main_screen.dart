// ignore_for_file: dead_code, prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, avoid_print, unused_field, unused_local_variable, non_constant_identifier_names

import 'dart:io';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/bill/view/bill_screen.dart';
import 'package:smarttv_app/app/modules/cart/controller/cart_controller.dart';
import 'package:smarttv_app/app/modules/event/view/event_screen.dart';
import 'package:smarttv_app/app/modules/home/view/home_screen.dart';
import 'package:smarttv_app/app/modules/local/view/local_screen.dart';
import 'package:smarttv_app/app/modules/main/controller/main_controller.dart';
import 'package:smarttv_app/app/modules/main/navigation/navigator_controller.dart';
import 'package:smarttv_app/app/modules/main/navigation/widget/widget_navigationslider.dart';
import 'package:smarttv_app/app/modules/notification/view/notification_screen.dart';

import 'package:smarttv_app/app/modules/service/view/service_screen.dart';
import 'package:smarttv_app/app/core/values/app_assets.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_const.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<FocusNode> focusNodes = [];
  // MainController maController = Get.find();
  NavigatorController naController =
      Get.find(tag: (NavigatorController).toString());

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 8; i++) {
      FocusNode focus = FocusNode();
      focusNodes.add(focus);
    }
  }

  @override
  void dispose() {
    for (int i = 0; i < 9; i++) {
      focusNodes[i].dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = true;
    setState(() {
      Future.delayed(
        Duration(milliseconds: 1000),
        () => isLoading = false,
      );
    });

    Size size = MediaQuery.of(context).size;
    CartController Cacontroller = Get.find();
    return WillPopScope(onWillPop: () async {
      return false;
    }, child: GetBuilder<MainController>(
      builder: (maController) {
        return Scaffold(
          floatingActionButton: Stack(
            children: [
              Align(
                alignment: Alignment(0.63, -0.94),
                child: SizedBox(
                  height: 35.h,
                  child: FloatingActionButton.extended(
                    heroTag: "btn1",
                    label: Text(
                      "0",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: AppColors.white),
                    ),
                    icon: Icon(
                      FluentIcons.alert_20_filled,
                      size: 25.r,
                      color: AppColors.white,
                    ),
                    backgroundColor: AppColors.focus,
                    elevation: 1,
                    focusElevation: 2,
                    focusColor: AppColors.orangeColor,
                    onPressed: () {
                      NotificationScreen().openDialog(context);
                      setState(() {
                        debugPrint("Check Notification!!");
                      });
                    },
                  ),
                ),
              ),
              Align(
                  alignment: Alignment(0.91, -0.92),
                  child: Obx(
                    () {
                      return SizedBox(
                          height: 35.h,
                          child: Text(
                            maController.formattedTime.string,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
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
                    color: AppColors.navigabackground,
                    child: Column(
                      children: [
                        SizedBox(
                          height: (size.height * 1 / 30).h,
                        ),
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
                                      fontSize: (size.width * 21 / 1000).sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        )),
                        Expanded(
                          flex: 5,
                          child: Container(
                            child: ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: 30,
                              ),
                              itemCount: 5,
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
                                        focusNode: focusNodes[index],
                                        borderRadius: BorderRadius.circular(12),
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
                                            // naController.select =!naController.select;
                                          });
                                        },
                                        child: buildNavigationWidget(
                                            naController.current_index.toInt(),
                                            naController
                                                .navigation_list[index].title,
                                            naController.navigation_list[index]
                                                .iconData,
                                            naController.navigation_list[index]
                                                .iconSelectedData,
                                            index,
                                            size),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Divider(
                          indent: 25.w,
                          endIndent: 25.w,
                          thickness: 1,
                          color: AppColors.white,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Material(
                            color: AppColors.navigabackground,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(15),
                              focusColor: AppColors.greyColor,
                              onTap: () {
                                setState(() {
                                  exit(0);
                                });
                              },
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(
                                      Icons.logout,
                                      color: AppColors.white,
                                      size: size.width * 1 / 40,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    SizedBox(
                                      // color: Colors.green,
                                      width: 129,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0, vertical: 0),
                                        child: Text(
                                          "exit".tr,
                                          style: TextStyle(
                                            fontSize: size.width * 1 / 70,
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  child: Container(
                child: IndexedStack(
                  index: naController.current_index.toInt(),
                  children: [
                    HomePage(),
                    ExcludeFocus(
                      // excluding: focusNodes[1].hasFocus ? false : true,
                      excluding: naController.current_index.toInt() == 1
                          ? false
                          : true,
                      // excluding: true,
                      child: ServiceScreen(),
                    ),
                    ExcludeFocus(
                      // excluding: focusNodes[2].hasFocus ? false : true,
                      excluding: naController.current_index.toInt() == 2
                          ? false
                          : true,

                      // excluding: true,
                      child: EventScreen(),
                    ),
                    ExcludeFocus(
                      // excluding: focusNodes[1].hasFocus ? false : true,
                      excluding: naController.current_index.toInt() == 3
                          ? false
                          : true,
                      // excluding: true,
                      child: LocalScreen(),
                    ),
                    ExcludeFocus(
                      // excluding: focusNodes[1].hasFocus ? false : true,
                      excluding: naController.current_index.toInt() == 4
                          ? false
                          : true,
                      // excluding: true,
                      child: BillScreen(),
                    ),
                  ],
                ),
              )),
            ],
          ),
        );
      },
    ));
  }
}
/*
Align(
              alignment: Alignment(0.7, -0.94),
              child: SizedBox(
                height: 35,
                child: FloatingActionButton.extended(
                  heroTag: "btn1",
                  label: Text(
                    maController.language.toString().tr,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  icon: Icon(
                    FluentIcons.local_language_24_filled,
                    size: 25,
                  ),
                  backgroundColor: AppColors.focus,
                  elevation: 1,
                  focusElevation: 2,
                  onPressed: () {
                    setState(() {
                      maController.isSwitch = !maController.isSwitch;
                      maController.switchLanguage();
                      Get.to(() => Loading());
                    });
                  },
                ),
              ),
            ),

 */
