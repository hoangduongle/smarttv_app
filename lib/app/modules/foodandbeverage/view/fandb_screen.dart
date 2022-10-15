import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/cart/controller/cart_controller.dart';
import 'package:smarttv_app/app/modules/foodandbeverage/controller/foodandbeverage_controller.dart';
import 'package:smarttv_app/app/modules/service_components/controller/list_service_controller.dart';
import 'package:smarttv_app/app/modules/service_components/loading/skeleton_loading.dart';
import 'package:smarttv_app/app/modules/foodandbeverage/widget/card_each_service.dart';

class FandBScreen extends StatefulWidget {
  const FandBScreen({super.key});

  @override
  State<FandBScreen> createState() => _FandBScreenState();
}

class _FandBScreenState extends State<FandBScreen> {
  int num = 0;
  @override
  Widget build(BuildContext context) {
    Size size = Size(960, 540);
    FoodandBeverageController controller = Get.find();
    CartController caController = Get.find();
    return Obx(
      () {
        return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
          floatingActionButton: Stack(
            children: [
              Align(
                alignment: Alignment(0.63.w, -0.94.h),
                child: SizedBox(
                  height: 35.h,
                  child: FloatingActionButton.extended(
                    heroTag: "btn1",
                    label: Text(
                      caController.sizeService.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: AppColors.black),
                    ),
                    icon: Icon(
                      FluentIcons.cart_20_filled,
                      size: 25.r,
                      color: AppColors.black,
                    ),
                    backgroundColor: AppColors.focus,
                    elevation: 1,
                    focusElevation: 2,
                    focusColor: AppColors.orangeColor,
                    onPressed: () {
                      Get.toNamed("/cart");
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0.95.w, -0.94.h),
                child: SizedBox(
                  height: 35.h,
                  child: FloatingActionButton.extended(
                    heroTag: "btn2",
                    label: Text(
                      "back".tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: AppColors.black),
                    ),
                    icon: Icon(
                      Icons.arrow_back,
                      size: 25.r,
                      color: AppColors.black,
                    ),
                    backgroundColor: AppColors.green,
                    elevation: 1,
                    focusElevation: 2,
                    focusColor: AppColors.greenFocus,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
              ),
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
                    Container(
                      padding: EdgeInsets.only(top: 60.h, left: 25.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                    AppColors.greyColor.withOpacity(.5))),
                            onPressed: () {
                              setState(() {
                                num = 0;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  "Thức ăn",
                                  style: AppStyles.h4.copyWith(
                                      //title
                                      color: num == 0
                                          ? AppColors.title
                                          : AppColors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * 25 / 1000.sp),
                                ),
                                Container(
                                  width: 110,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color: num == 0
                                              ? AppColors.title
                                              : AppColors.white,
                                          width: 1.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                num = 1;
                              });
                            },
                            style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                    AppColors.greyColor.withOpacity(.5))),
                            child: Column(
                              children: [
                                Text(
                                  "Đồ uống",
                                  style: AppStyles.h4.copyWith(
                                      //title
                                      color: num == 1
                                          ? AppColors.title
                                          : AppColors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * 25 / 1000.sp),
                                ),
                                Container(
                                  width: 110,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color: num == 1
                                              ? AppColors.title
                                              : AppColors.greyColor,
                                          width: 1.0),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    controller.serviceListFood.value.isEmpty &&
                            controller.serviceListDrink.value.isEmpty
                        ? SkeletonLoadingServiceConponentScreen()
                        : Expanded(
                            child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 10.h),
                            child: GridView.builder(
                                itemCount: num == 0
                                    ? controller.serviceListFood.value.length
                                    : controller.serviceListDrink.value.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 60.w,
                                  mainAxisSpacing: 36,
                                  mainAxisExtent: 210.h,
                                ),
                                itemBuilder: (context, index) {
                                  return IndexedStack(
                                    index: num,
                                    children: [
                                      ExcludeFocus(
                                        excluding: num == 0 ? false : true,
                                        child: CardEachService(
                                          index: index,
                                          serviceContent: controller
                                              .serviceListFood.value[index],
                                        ),
                                      ),
                                      ExcludeFocus(
                                        excluding: num == 1 ? false : true,
                                        child: CardEachService(
                                          index: index,
                                          serviceContent: controller
                                              .serviceListDrink.value[index],
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          )),
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
