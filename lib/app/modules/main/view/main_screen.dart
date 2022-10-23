// ignore_for_file: dead_code, prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, avoid_print, unused_field, unused_local_variable, non_constant_identifier_names, unrelated_type_equality_checks

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/bill/view/bill_screen.dart';
import 'package:smarttv_app/app/modules/cart/controller/cart_controller.dart';
import 'package:smarttv_app/app/modules/event/view/event_screen.dart';
import 'package:smarttv_app/app/modules/foodandbeverage/view/fandb_screen.dart';
import 'package:smarttv_app/app/modules/home/view/home_screen.dart';
import 'package:smarttv_app/app/modules/abtraction/view/abtraction_screen.dart';
import 'package:smarttv_app/app/modules/main/controller/main_controller.dart';
import 'package:smarttv_app/app/modules/main/navigation/navigator_controller.dart';
import 'package:smarttv_app/app/modules/main/navigation/widget/widget_navigationslider.dart';
import 'package:smarttv_app/app/modules/service/view/service_screen.dart';
import 'package:smarttv_app/app/core/values/app_assets.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_const.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smarttv_app/app/modules/service_components/view/list_service_screen.dart';

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
    Size size = MediaQuery.of(context).size;
    CartController Cacontroller = Get.find();
    return WillPopScope(onWillPop: () async {
      bool result = false;
      switch (naController.current_index.toInt()) {
        case 0:
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
                      borderRadius: BorderRadius.circular(5.r),
                      elevation: 0,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
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
                      borderRadius: BorderRadius.circular(5.r),
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
          break;
        case 1:
          naController.current_index = 0.obs;
          break;
        case 2:
          naController.current_index = 0.obs;
          break;
        case 3:
          naController.current_index = 0.obs;
          break;
        case 4:
          naController.current_index = 0.obs;
          break;
        case 5:
          naController.current_index = 0.obs;
          break;
        case 6:
          naController.current_index = 0.obs;
          break;
        case 7:
          naController.current_index = 1.obs;
          break;
        default:
      }
      return result;
    }, child: GetBuilder<MainController>(
      builder: (maController) {
        return Scaffold(
          floatingActionButton: Stack(
            children: [
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
                          flex: 5,
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
                      //  ServiceScreen()
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
                      child: AbtractionScreen(),
                    ),
                    ExcludeFocus(
                      // excluding: focusNodes[1].hasFocus ? false : true,
                      excluding: naController.current_index.toInt() == 4
                          ? false
                          : true,
                      // excluding: true,
                      child: Container(
                        color: AppColors.background,
                      ),
                    ),
                    ExcludeFocus(
                      // excluding: focusNodes[1].hasFocus ? false : true,
                      excluding: naController.current_index.toInt() == 5
                          ? false
                          : true,
                      // excluding: true,
                      child: BillScreen(),
                    ),
                    ExcludeFocus(
                      // excluding: focusNodes[1].hasFocus ? false : true,
                      excluding: naController.current_index.toInt() == 6
                          ? false
                          : true,
                      // excluding: true,
                      child: Container(
                        color: AppColors.background,
                      ),
                    ),
                    ExcludeFocus(
                      // excluding: focusNodes[1].hasFocus ? false : true,
                      excluding: naController.current_index.toInt() == 7
                          ? false
                          : true,
                      // excluding: true,
                      child: ListServiceScreen(
                        cateName: '',
                      ),
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
