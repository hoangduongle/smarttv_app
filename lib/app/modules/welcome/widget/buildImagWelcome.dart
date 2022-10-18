// ignore_for_file: prefer_interpolation_to_compose_strings, unnecessary_brace_in_string_interps, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/main/navigation/navigator_controller.dart';
import 'package:smarttv_app/app/modules/welcome/controller/wellcome_controller.dart';

Widget buildImageWelcome(Size size, int index, BuildContext context) {
  double setWidth = size.width.w;
  NavigatorController naController =
      Get.find(tag: (NavigatorController).toString());
  WellcomeController controller = Get.find();
  return InkWell(
    autofocus: index == 2,
    onFocusChange: (value) {
      controller.isFocus[index] = value;
    },
    onTap: () {
      debugPrint("Tap: $index");
      debugPrint("${controller.isFocus}");
      switch (index) {
        case 0: // abtraction
          naController.current_index = 3.obs;
          Get.offNamed('/mainscreen');
          break;
        case 1: //promotion
          naController.current_index = 2.obs;
          Get.offNamed('/mainscreen');
          break;
        case 2: //home
          naController.current_index = 0.obs;
          Get.offNamed('/mainscreen');
          break;
        case 3: //service
          naController.current_index = 1.obs;
          Get.offNamed('/mainscreen');
          break;
        case 4: //event
          naController.current_index = 2.obs;
          Get.offNamed('/mainscreen');
          break;
        default:
          naController.current_index = 0.obs;
          Get.offNamed('/mainscreen');
          break;
      }
    },
    child: SizedBox(
      width: 125.w,
      height: 100.h,
      child: Stack(
        children: [
          Positioned(
            bottom: 0.h,
            left: 0.w,
            right: 0.w,
            child: Container(
              height: 50.h,
              decoration: const BoxDecoration(
                color: AppColors.transparent,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  controller.name[index],
                  textAlign: TextAlign.center,
                  style: AppStyles.h4.copyWith(
                      color: controller.isFocus[index]
                          ? AppColors.title
                          : AppColors.greyColor,
                      fontSize: (size.width * 0.02).sp),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeIn,
              width: controller.isFocus[index] ? 110.w : 90.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: controller.isFocus[index]
                        ? AppColors.title
                        : AppColors.greyColor,
                    width: 2.w),
                image: DecorationImage(
                  image: NetworkImage(controller.image[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
//https://images.unsplash.com/photo-1551573355-19727699d60a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80
//controller.image[index]
/* 
Material(
    color: AppColors.transparent,
    child: InkWell(
      onTap: () {
        debugPrint(index.toString());
        naController.current_index = index.obs;
        Get.offNamed('/mainscreen');
      },
      borderRadius: BorderRadius.circular(100),
      focusColor: AppColors.greyColor.withOpacity(0.2),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.white, width: 2),
          image: DecorationImage(
            image: NetworkImage(controller.image[index]),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
*/