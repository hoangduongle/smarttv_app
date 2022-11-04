// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/event/controller/event_controller.dart';

class TitleEvent extends StatelessWidget {
  String name;
  int indexType;
  TitleEvent({
    Key? key,
    required this.name,
    required this.indexType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EventController controller = Get.find();
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        alignment: Alignment.center,
        width: 160.w,
        height: 30.h,
        decoration: BoxDecoration(
            color: controller.isFocus[indexType]
                ? AppColors.title
                : AppColors.transparent,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: AppColors.white, width: 1.w)),
        child: Text(name,
            style: AppStyles.h4.copyWith(
                color: AppColors.header,
                fontSize: (size.width * 0.018).sp,
                fontWeight: FontWeight.normal)),
      ),
    );
  }
}
/*
Align(
      alignment: Alignment.centerLeft,
      child: Material(
        color: AppColors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10.r),
          focusColor: AppColors.title,
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            width: 160.w,
            height: 30.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.white, width: 1.w)),
            child: Text(name,
                style: AppStyles.h4.copyWith(
                    color: AppColors.header,
                    fontSize: (size.width * 0.018).sp,
                    fontWeight: FontWeight.normal)),
          ),
        ),
      ),
    );
*/

/*
Align(
      alignment: Alignment.centerLeft,
      child: Container(
        alignment: Alignment.center,
        width: 160.w,
        height: 30.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: AppColors.white, width: 1.w)),
        child: Text(name,
            style: AppStyles.h4.copyWith(
                color: AppColors.header,
                fontSize: (size.width * 0.018).sp,
                fontWeight: FontWeight.normal)),
      ),
    );
*/