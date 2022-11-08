// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/main/navigation/navigator_controller.dart';

class AbtractionLoading extends StatelessWidget {
  const AbtractionLoading({super.key});

  @override
  Widget build(BuildContext context) {
    NavigatorController naController =
        Get.find(tag: (NavigatorController).toString());
    return Expanded(
        flex: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Material(
            color: AppColors.greyColor,
            borderRadius: BorderRadius.circular(10.r),
            child: InkWell(
              borderRadius: BorderRadius.circular(10.r),
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(2.r),
                width: 400.w,
                height: 200.h,
                decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Shimmer.fromColors(
                      baseColor: AppColors.greyColor.withOpacity(0.5),
                      highlightColor: AppColors.white,
                      period: const Duration(milliseconds: 1500),
                      child: Container(
                        height: 100.h,
                        width: 450.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.r),
                                topRight: Radius.circular(10.r)),
                            color: AppColors.greyColor),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Shimmer.fromColors(
                      baseColor: AppColors.greyColor.withOpacity(0.5),
                      highlightColor: AppColors.white,
                      period: const Duration(milliseconds: 1500),
                      child: Container(
                        height: 30.h,
                        width: 200.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColors.greyColor),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Shimmer.fromColors(
                      baseColor: AppColors.greyColor.withOpacity(0.5),
                      highlightColor: AppColors.white,
                      period: const Duration(milliseconds: 1500),
                      child: Container(
                        height: 30.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColors.greyColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
