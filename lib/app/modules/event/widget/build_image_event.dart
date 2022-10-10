// ignore_for_file: prefer_interpolation_to_compose_strings, unnecessary_brace_in_string_interps

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/event/widget/event_dialog.dart';

Widget buildImageEvent(Size size, int index, BuildContext context) {
  return Material(
    color: Colors.transparent,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    borderRadius: BorderRadius.circular(15.r),
    child: InkWell(
      onTap: () {
        debugPrint(index.toString());
        const EventDialog().showEventDialog(context, index);
      },
      focusColor: AppColors.focus,
      borderRadius: BorderRadius.circular(15.r),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: CachedNetworkImage(
          imageUrl:
              "https://images.unsplash.com/photo-1551573355-19727699d60a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
          imageBuilder: (context, imageProvider) {
            return Container(
              height: (size.height * 1 / 2).h,
              width: size.width.w,
              margin: EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 4.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0.r),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fill,
                ),
              ),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                    height: (size.height * 1 / 5).h,
                    width: size.width.w,
                    decoration: BoxDecoration(
                        color: Colors.black87.withOpacity(0.8),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15.r),
                            bottomRight: Radius.circular(15.r))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Hội chợ địa phương",
                                  style: AppStyles.h4.copyWith(
                                      color: AppColors.white,
                                      fontSize: (size.height * 4 / 100).sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "16:00 - 20:00",
                                  style: AppStyles.h4.copyWith(
                                    color: AppColors.white,
                                    fontSize: (size.height * 4 / 120).sp,
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.w, 0.h, 10.w, 10.h),
                          child: Text(
                            'Đây là nơi giao lưu bày bán các mặt hàng của những người dân địa phương và là một địa điểm tham quan và mua sắm những món quà lưu niệm.',
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
          // placeholder: (context, url) {
          //   return SkeletonLoadingHomeScreen(size);
          // },
        ),
      ),
    ),
  );
}
