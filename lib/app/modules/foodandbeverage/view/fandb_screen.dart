// ignore_for_file: unused_local_variable
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/cart/controller/cart_controller.dart';
import 'package:smarttv_app/app/modules/foodandbeverage/controller/foodandbeverage_controller.dart';
import 'package:smarttv_app/app/modules/main/controller/main_controller.dart';
import 'package:smarttv_app/app/modules/navigation/controller/navigator_controller.dart';
import 'package:smarttv_app/app/modules/foodandbeverage/widget/card_each_service.dart';
import 'package:smarttv_app/app/routes/app_pages.dart';
import 'package:smarttv_app/app/widget/navigator_back.dart';
import 'package:smarttv_app/app/widget/titile_screen.dart';

class FandBScreen extends StatefulWidget {
  const FandBScreen({super.key});

  @override
  State<FandBScreen> createState() => _FandBScreenState();
}

class _FandBScreenState extends State<FandBScreen> {
  @override
  Widget build(BuildContext context) {
    CartController caController = Get.find();
    NavigatorController naController =
        Get.find(tag: (NavigatorController).toString());
    MainController maController = Get.find();
    FoodandBeverageController controller = Get.find();
    /*
      return Obx(
      () {
        return GetBuilder<FoodandBeverageController>(
      builder: (controller) {
    */
    return Obx(
      () {
        return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
          floatingActionButton: Stack(
            children: [
              NavigatorBack(),
              caController.sizeService <= 0
                  ? Stack()
                  : Stack(
                      children: [
                        Align(
                          alignment: Alignment(0.72.w, -0.92.h),
                          child: Material(
                            color: AppColors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(100.r),
                              focusColor: AppColors.orangeColor,
                              onTap: () {
                                Get.toNamed(Routes.CART);
                              },
                              child: Icon(
                                FluentIcons.cart_20_regular,
                                size: 30.r,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0.725.w, -0.905.h), //0.74 -0.945
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
                  alignment: Alignment(0.95.w, -0.90.h),
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
          body: Row(
            children: [
              Expanded(
                  child: Container(
                color: AppColors.background,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleScreen(name: "Thức ăn và đồ uống"),
                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                      child: Container(
                        height: 35.h,
                        width: 262.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            border:
                                Border.all(width: 1, color: AppColors.white)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(3.r),
                                        bottomLeft: Radius.circular(3.r)),
                                  )),
                                  fixedSize: MaterialStateProperty.all(
                                      Size(130.w, 0.h)),
                                  backgroundColor: MaterialStateProperty.all(
                                    controller.numberSelected.toInt() == 0
                                        ? AppColors.orangeColor
                                        : AppColors.transparent,
                                  ),
                                  overlayColor: MaterialStateProperty.all(
                                      AppColors.greyColor)),
                              onPressed: () {
                                setState(() {
                                  controller.numberSelected = 0.obs;
                                });
                              },
                              child: Text(
                                "Thức ăn",
                                style: AppStyles.h4.copyWith(
                                    color:
                                        controller.numberSelected.toInt() == 0
                                            ? AppColors.black
                                            : AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  controller.numberSelected = 1.obs;
                                });
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(3.r),
                                        bottomRight: Radius.circular(3.r)),
                                  )),
                                  fixedSize: MaterialStateProperty.all(
                                      Size(130.w, 0.h)),
                                  backgroundColor: MaterialStateProperty.all(
                                    controller.numberSelected.toInt() == 1
                                        ? AppColors.orangeColor
                                        : AppColors.transparent,
                                  ),
                                  overlayColor: MaterialStateProperty.all(
                                      AppColors.greyColor)),
                              child: Text(
                                "Đồ uống",
                                style: AppStyles.h4.copyWith(
                                    //title
                                    color:
                                        controller.numberSelected.toInt() == 1
                                            ? AppColors.black
                                            : AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 5.h)),
                    controller.mayjorFood.isEmpty &&
                            controller.mayjorDrink.isEmpty
                        ? Expanded(
                            child: Center(
                                child: Lottie.asset(
                                    "assets/lotties/loading.json",
                                    width: 300.w)))
                        : Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 10.h),
                              child: IndexedStack(
                                index: controller.numberSelected.toInt(),
                                children: [
                                  ExcludeFocus(
                                    excluding:
                                        controller.numberSelected.toInt() == 0
                                            ? false
                                            : true,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 140.w),
                                      child: GridView.builder(
                                        shrinkWrap: true,
                                        itemCount: controller.mayjorFood.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisExtent: 185,
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 30.w,
                                          mainAxisSpacing: 20.h,
                                        ),
                                        itemBuilder: (context, index) {
                                          return CardEachService(
                                            index: index,
                                            mayjorContent:
                                                controller.mayjorFood[index],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  ExcludeFocus(
                                    excluding:
                                        controller.numberSelected.toInt() == 1
                                            ? false
                                            : true,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 140.w),
                                      child: GridView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                            controller.mayjorDrink.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisExtent: 185,
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 30.w,
                                          mainAxisSpacing: 20.h,
                                        ),
                                        itemBuilder: (context, index) {
                                          return CardEachService(
                                            index: index,
                                            mayjorContent:
                                                controller.mayjorDrink[index],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                  ],
                ),
              )),
            ],
          ),
        );
      },
    );
  }
}
