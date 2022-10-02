// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/local/controller/local_controller.dart';

import 'package:smarttv_app/app/values/app_colors.dart';
import 'package:smarttv_app/app/values/app_styles.dart';

class LocalScreen extends GetView<LocalController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          color: AppColors.background,
          child: Column(
            children: [
              Expanded(
                  child: Container(
                color: AppColors.background,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 42.h, left: 15.w),
                      child: Text(
                        'Địa điểm ăn uống',
                        style: AppStyles.h4.copyWith(
                            color: AppColors.header,
                            fontSize: (size.width * 25 / 1000).sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              )),
            ],
          )),
    );
  }
}
