// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smarttv_app/app/core/model/news_content.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/event/controller/event_controller.dart';
import 'package:smarttv_app/app/modules/event/widget/event_dialog.dart';

class BuildEvent extends StatefulWidget {
  int indexType;
  int index;
  NewsContent newsContent;
  EventController controller;
  ScrollController scrollController;
  BuildEvent({
    Key? key,
    required this.indexType,
    required this.index,
    required this.newsContent,
    required this.controller,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<BuildEvent> createState() => _BuildEventState();
}

class _BuildEventState extends State<BuildEvent> {
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onFocusChange: (value) {
          // widget.controller.isFocus[widget.indexType] = value;

          if (widget.indexType == 0) {
            widget.scrollController.animateTo(
                widget.scrollController.position.minScrollExtent,
                duration: const Duration(milliseconds: 100),
                curve: Curves.decelerate);
          } else if (widget.indexType == 2) {
            widget.scrollController.animateTo(
                widget.scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 100),
                curve: Curves.decelerate);
          }
        },
        borderRadius: BorderRadius.circular(10.r),
        focusColor: AppColors.title,
        onTap: () {
          const EventDialog()
              .showEventDialog(context, widget.index, widget.newsContent);
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
                                  widget.newsContent.newName.toString(),
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
                                          "Từ ${widget.newsContent.startTime} - ${widget.newsContent.startDate}",
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
                                          widget.newsContent.numberOfView
                                              .toString(),
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
