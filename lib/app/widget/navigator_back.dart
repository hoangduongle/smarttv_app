// ignore_for_file: must_be_immutable

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:smarttv_app/app/core/values/app_colors.dart';

class NavigatorBack extends StatelessWidget {
  double x;
  double y;
  bool autoFocus;
  Color background;
  NavigatorBack({
    Key? key,
    this.x = -0.955,
    this.y = 0.955,
    this.autoFocus = false,
    this.background = AppColors.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(x.w, y.h),
      child: Material(
        color: AppColors.transparent,
        child: InkWell(
          autofocus: autoFocus,
          focusColor: AppColors.orangeColor,
          borderRadius: BorderRadius.circular(100.r),
          onTap: () {
            Get.back();
          },
          child: Container(
            height: 31,
            margin: EdgeInsets.all(2.r),
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(100.r),
            ),
            child: Icon(
              size: 30.sp,
              FluentIcons.arrow_circle_left_12_regular,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
