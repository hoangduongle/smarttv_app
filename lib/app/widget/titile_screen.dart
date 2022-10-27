// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';

class TitleScreen extends StatelessWidget {
  String name;
  TitleScreen({
    Key? key,
    this.name = "@Name",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 25.h, left: 30.w),
          child: Text(
            name.tr,
            style: AppStyles.h4.copyWith(
                color: AppColors.header,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        Divider(
          color: AppColors.greyColor,
          indent: 20.w,
          endIndent: 20.w,
        ),
      ],
    );
  }
}
