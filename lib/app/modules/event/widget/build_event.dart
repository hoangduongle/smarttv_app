// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smarttv_app/app/core/model/event_content.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/event/controller/event_controller.dart';
import 'package:smarttv_app/app/modules/event/widget/event_dialog.dart';

class BuildEvent extends StatelessWidget {
  int indexType;
  int index;
  EventContent eventContent;
  EventController controller;

  BuildEvent({
    Key? key,
    required this.indexType,
    required this.index,
    required this.eventContent,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onFocusChange: (value) {
          controller.isFocus[indexType] = value;
        },
        borderRadius: BorderRadius.circular(10.r),
        focusColor: AppColors.title,
        onTap: () {
          const EventDialog().showEventDialog(context, index, eventContent);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: CachedNetworkImage(
            imageUrl:
                "https://toanthaydinh.com/wp-content/uploads/2020/04/hinh-anh-buon.png6_.jpg",
            imageBuilder: (context, imageProvider) {
              return Container(
                margin: EdgeInsets.all(2.r),
                height: size.height.h,
                width: 400.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 70.h,
                      width: size.width.w,
                      decoration: BoxDecoration(
                          color: AppColors.black.withOpacity(0.8),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.r),
                              bottomRight: Radius.circular(10.r))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 4.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  eventContent.name.toString(),
                                  style: AppStyles.h4.copyWith(
                                      color: AppColors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(FluentIcons.clock_16_regular,
                                            color: AppColors.white,
                                            size: 16.sp),
                                        Text(
                                          "Từ ${eventContent.startTime} - ${eventContent.startDate}",
                                          style: AppStyles.h4.copyWith(
                                              color: AppColors.greyColor,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(FluentIcons.eye_20_regular,
                                            color: AppColors.white,
                                            size: 16.sp),
                                        Text(
                                          eventContent.numberOfView.toString(),
                                          style: AppStyles.h4.copyWith(
                                              color: AppColors.greyColor,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
