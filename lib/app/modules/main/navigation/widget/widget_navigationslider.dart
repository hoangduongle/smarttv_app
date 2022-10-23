// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';

Widget buildNavigationWidget(int index, String title, IconData? icons,
    IconData? iconSelected, int active, Size size) {
  switch (index) {
    case 7:
      index = 1;
      break;
    default:
      index;
  }

  return Container(
    padding: EdgeInsets.only(left: (size.width * 0.02).w),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            index == active ? iconSelected : icons,
            color: index == active ? AppColors.focus : Colors.white,
            size: (size.width * 1 / 42).w,
          ),
          SizedBox(
            width: 6.w,
          ),
          Container(
            width: 150.w,
            padding: EdgeInsets.symmetric(
                horizontal: 12.w, vertical: (size.height * 0.02).w),
            child: Text(
              title.tr,
              style: AppStyles.h5.copyWith(
                fontWeight:
                    index == active ? FontWeight.bold : FontWeight.normal,
                fontSize: (size.width * 1 / 48).sp,
                color: index == active ? AppColors.focus : Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
