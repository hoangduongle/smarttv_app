// ignore_for_file: must_be_immutable, unused_local_variable

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
  bool isFocus;
  TitleEvent({
    Key? key,
    required this.name,
    required this.indexType,
    required this.isFocus,
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
            color: isFocus ? AppColors.title : AppColors.transparent,
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
