// ignore_for_file: prefer_interpolation_to_compose_strings, unnecessary_brace_in_string_interps

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smarttv_app/app/core/model/overview_content.dart';
import 'package:smarttv_app/app/values/app_colors.dart';
import 'package:smarttv_app/app/values/app_styles.dart';

Widget buildImage(OverviewContent overviewContent, int index, Size size) {
  List<String> arrDescription = overviewContent.description!.split("+");

  return Container(
    padding: EdgeInsets.only(top: 8.h),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15.r),
      child: CachedNetworkImage(
        imageUrl: overviewContent.imageUrl!,
        imageBuilder: (context, imageProvider) {
          return Container(
            height: (size.height * 1 / 2).h,
            width: size.width.w,
            margin: EdgeInsets.symmetric(horizontal: 8.0.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0.r),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fill,
              ),
            ),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                  height: (size.height * 1 / 4).h,
                  width: size.width.w,
                  decoration: BoxDecoration(
                      color: Colors.black87.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15.r),
                          bottomRight: Radius.circular(15.r))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0.r),
                        child: Text(
                          overviewContent.title!,
                          style: AppStyles.h4.copyWith(
                              color: AppColors.white,
                              fontSize: (size.height * 4 / 100).sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      for (var description in arrDescription)
                        if (description != '')
                          Padding(
                            padding: EdgeInsets.only(
                                left: 6.w, bottom: 6.h, top: 2.h),
                            child: Text(
                              ' + ${description}',
                              style: AppStyles.h4.copyWith(
                                  color: AppColors.white,
                                  fontSize: (size.height * 3 / 100).sp),
                            ),
                          )
                    ],
                  )),
            ]),
          );
        },
        placeholder: (context, url) {
          return Container();
        },
      ),
    ),
  );
}
