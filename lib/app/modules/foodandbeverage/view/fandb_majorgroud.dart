// ignore_for_file: unused_local_variable, must_be_immutable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';

import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/cart/controller/cart_controller.dart';
import 'package:smarttv_app/app/modules/foodandbeverage/controller/foodandbeverage_controller.dart';
import 'package:smarttv_app/app/modules/foodandbeverage/widget/mayjor_each_service.dart';
import 'package:smarttv_app/app/modules/main/controller/main_controller.dart';
import 'package:smarttv_app/app/modules/main/navigation/navigator_controller.dart';
import 'package:smarttv_app/app/modules/service_components/loading/skeleton_loading.dart';
import 'package:smarttv_app/app/routes/app_pages.dart';
import 'package:smarttv_app/app/widget/navigator_back.dart';
import 'package:smarttv_app/app/widget/titile_screen.dart';

class FandBMayjorScreen extends StatefulWidget {
  int mayjorId;
  String mayjorName;
  FandBMayjorScreen({
    Key? key,
    required this.mayjorId,
    required this.mayjorName,
  }) : super(key: key);

  @override
  State<FandBMayjorScreen> createState() => _FandBMayjorScreenState();
}

class _FandBMayjorScreenState extends State<FandBMayjorScreen> {
  @override
  Widget build(BuildContext context) {
    FoodandBeverageController controller = Get.find();
    CartController caController = Get.find();
    MainController maController = Get.find();
    Rx<List<ServiceContent>> serviceContent = Rx<List<ServiceContent>>([]);
    int length = 0;
    switch (widget.mayjorId) {
      case 0:
        serviceContent = controller.serviceKhaivi;
        length = controller.serviceKhaivi.value.length;
        break;
      case 1:
        serviceContent = controller.serviceMonchinh;
        length = controller.serviceMonchinh.value.length;
        break;
      case 2:
        serviceContent = controller.serviceTrangmieng;
        length = controller.serviceTrangmieng.value.length;
        break;
      case 3:
        serviceContent = controller.serviceNuoctra;
        length = controller.serviceNuoctra.value.length;
        break;
      case 4:
        serviceContent = controller.serviceNuocsuoi;
        length = controller.serviceNuocsuoi.value.length;
        break;
      case 5:
        serviceContent = controller.serviceBia;
        length = controller.serviceBia.value.length;
        break;
      case 6:
        serviceContent = controller.serviceNuocmocktails;
        length = controller.serviceNuocmocktails.value.length;
        break;
    }
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
                    TitleScreen(
                      name: "Thức ăn và đồ uống",
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10.h,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text(
                              widget.mayjorName, //<=======================
                              style: AppStyles.h4.copyWith(
                                  //title
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 2.h),
                              width: 80,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: AppColors.white, width: 1.w),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (controller.serviceListFood.value.isEmpty &&
                        controller.serviceListDrink.value.isEmpty)
                      SkeletonLoadingServiceConponentScreen()
                    else
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.w, vertical: 20.h),
                          child: GridView.builder(
                            itemCount: length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 180,
                              crossAxisCount: 5,
                              crossAxisSpacing: 20.w,
                              mainAxisSpacing: 16.h,
                            ),
                            itemBuilder: (context, index) {
                              return MayjorEachService(
                                index: index,
                                serviceContent: serviceContent.value[index],
                              );
                            },
                          ),
                        ),
                      ),
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
