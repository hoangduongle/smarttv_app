import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/model/news_content.dart';
import 'package:smarttv_app/app/modules/event/controller/event_controller.dart';

import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/event/loading/skeleton_event.dart';
import 'package:smarttv_app/app/modules/event/widget/build_event.dart';
import 'package:smarttv_app/app/modules/event/widget/event_dialog.dart';

import 'package:smarttv_app/app/modules/event/widget/title_event.dart';
import 'package:smarttv_app/app/widget/titile_screen.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  var isFocus = [false, false, false];
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    Size size = MediaQuery.of(context).size;
    return GetBuilder<EventController>(
      builder: (controller) {
        return Container(
            color: AppColors.background,
            child: Column(
              children: [
                TitleScreen(
                  name: "event".tr,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30.w, 10.h, 30.w, 0.h),
                      child: Column(
                        children: [
                          //===================================================
                          TitleEvent(
                            name: "Đang diễn ra",
                            indexType: 0,
                            isFocus: isFocus[0],
                          ),
                          controller.eventList.value.isEmpty
                              ? const SkeletonEvent()
                              : Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15.h),
                                  child: SizedBox(
                                    width: size.width.w,
                                    height: 150.h,
                                    child: ListView.builder(
                                      primary: true,
                                      itemCount:
                                          controller.eventList.value.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(right: 10.w),
                                          child: _buildEvent(
                                              0,
                                              index,
                                              controller.eventList.value[index],
                                              controller,
                                              scrollController,
                                              size),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                          //====================================================
                          TitleEvent(
                            name: "Sắp diễn ra",
                            indexType: 1,
                            isFocus: isFocus[1],
                          ),
                          controller.eventList.value.isEmpty
                              ? const SkeletonEvent()
                              : Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15.h),
                                  child: SizedBox(
                                    width: size.width.w,
                                    height: 150.h,
                                    child: ListView.builder(
                                      primary: true,
                                      itemCount:
                                          controller.eventList.value.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(right: 10.w),
                                          child: _buildEvent(
                                              1,
                                              index,
                                              controller.eventList.value[index],
                                              controller,
                                              scrollController,
                                              size),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                          //====================================================
                          TitleEvent(
                            name: "Đã diễn ra",
                            indexType: 2,
                            isFocus: isFocus[2],
                          ),
                          controller.eventList.value.isEmpty
                              ? const SkeletonEvent()
                              : Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15.h),
                                  child: SizedBox(
                                    width: size.width,
                                    height: 150.h,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          controller.eventList.value.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(right: 10.w),
                                          child: _buildEvent(
                                              2,
                                              index,
                                              controller.eventList.value[index],
                                              controller,
                                              scrollController,
                                              size),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }

  Widget _buildEvent(
    int indexType,
    int index,
    NewsContent newsContent,
    EventController controller,
    ScrollController scrollController,
    Size size,
  ) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onFocusChange: (value) {
          setState(() {
            isFocus[indexType] = value;
            debugPrint("$indexType: ${isFocus[indexType]}");
          });
          if (indexType == 0) {
            scrollController.animateTo(
                scrollController.position.minScrollExtent,
                duration: const Duration(milliseconds: 100),
                curve: Curves.decelerate);
          } else if (indexType == 2) {
            scrollController.animateTo(
                scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 100),
                curve: Curves.decelerate);
          }
        },
        borderRadius: BorderRadius.circular(10.r),
        focusColor: AppColors.title,
        onTap: () {
          const EventDialog().showEventDialog(context, index, newsContent);
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
                                  newsContent.newName.toString(),
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
                                          "Từ ${newsContent.startTime} - ${newsContent.startDate}",
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
                                          newsContent.numberOfView.toString(),
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
