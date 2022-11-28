// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smarttv_app/app/core/utils/number_utils.dart';
import 'package:smarttv_app/app/core/values/app_assets.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';

class TurndownDialogWidget extends StatelessWidget {
  const TurndownDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void showTurndownDialog(BuildContext context, int hours, int minutes) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        elevation: 2,
        backgroundColor: AppColors.navigabackground,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        child: SizedBox(
          width: 500.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AppAssets.done, width: 100.w),
              Text(
                "Yêu cầu dọn phòng nhanh của quý khách sẽ được thực hiện vào lúc",
                // textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "${NumberUtils.time(hours)}:${NumberUtils.time(minutes)}",
                // textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.title),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Cám ơn quý khách đã sử dụng dịch vụ của chúng tôi",
                // textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.greyColor),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 100.w,
                height: 30.h,
                child: Material(
                  color: AppColors.focus,
                  borderRadius: BorderRadius.circular(10.r),
                  child: InkWell(
                    autofocus: true,
                    focusColor: AppColors.orangeColor,
                    borderRadius: BorderRadius.circular(10.r),
                    onTap: () {
                      Get.back();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'back'.tr,
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
                height: 20.h,
              ),
            ],
            // caController.addService(serviceContent);
          ),
        ),
      ),
    );
  }

  void showTurndownDialogFail(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        elevation: 2,
        backgroundColor: AppColors.navigabackground,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        child: SizedBox(
          width: 350.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Lottie.asset(AppAssets.uncheck, width: 80.w),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Xin lỗi quý khách, hệ thống đang trục trặc",
                // textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Xin quý khách thử lại sau",
                // textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.greyColor),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 100.w,
                height: 30.h,
                child: Material(
                  color: AppColors.focus,
                  borderRadius: BorderRadius.circular(10.r),
                  child: InkWell(
                    autofocus: true,
                    focusColor: AppColors.orangeColor,
                    borderRadius: BorderRadius.circular(10.r),
                    onTap: () {
                      Get.back();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'back'.tr,
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
                height: 20.h,
              ),
            ],
            // caController.addService(serviceContent);
          ),
        ),
      ),
    );
  }
}
