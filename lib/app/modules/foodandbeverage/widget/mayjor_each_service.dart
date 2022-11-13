// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/core/utils/number_utils.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/foodandbeverage/widget/dialog.dart';

class MayjorEachService extends StatelessWidget {
  int index;
  ServiceContent serviceContent;
  MayjorEachService({
    Key? key,
    required this.index,
    required this.serviceContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Material(
        color: AppColors.transparent,
        child: InkWell(
          autofocus: index == 0,
          borderRadius: BorderRadius.circular(10.r),
          focusColor: AppColors.title,
          onTap: () {
            DialogWidget(
              index: index,
            ).showServiceDialog(context, serviceContent);
          },
          child: Container(
            margin: EdgeInsets.all(2.r),
            decoration: BoxDecoration(
                color: AppColors.navigabackground,
                borderRadius: BorderRadius.circular(10.r)),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 0.h),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://static.vecteezy.com/packs/media/vectors/term-bg-1-666de2d9.jpg",
                      height: 105.h,
                      width: 148.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  serviceContent.name.toString(), //<------ set controller
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: AppColors.white),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  NumberUtils.vnd(
                      serviceContent.price), //<------ set controller
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                      color: AppColors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
