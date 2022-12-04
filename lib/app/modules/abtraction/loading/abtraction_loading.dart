// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/navigation/controller/navigator_controller.dart';
import 'package:smarttv_app/app/widget/shimmer_loading.dart';

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
                    const ShimmerLoading(height: 100, width: 450),
                    _sizeHeight(),
                    const ShimmerLoading(height: 30, width: 200),
                    _sizeHeight(),
                    const ShimmerLoading(height: 30, width: 150),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  SizedBox _sizeHeight() {
    return SizedBox(
      height: 10.h,
    );
  }
}
