import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/model/news_content.dart';
import 'package:smarttv_app/app/core/values/app_assets.dart';
import 'package:smarttv_app/app/modules/event/controller/event_controller.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/event/loading/skeleton_event.dart';
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
                          controller.eventListOn.value.isEmpty
                              ? const SkeletonEvent()
                              : Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15.h),
                                  child: SizedBox(
                                    width: size.width.w,
                                    height: 150.h,
                                    child: ListView.builder(
                                      primary: true,
                                      itemCount:
                                          controller.eventListOn.value.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(right: 10.w),
                                          child: _buildEvent(
                                              0,
                                              index,
                                              controller
                                                  .eventListOn.value[index],
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
                          controller.eventListReady.value.isEmpty
                              ? const SkeletonEvent()
                              : Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15.h),
                                  child: SizedBox(
                                    width: size.width.w,
                                    height: 150.h,
                                    child: ListView.builder(
                                      itemCount: controller
                                          .eventListReady.value.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(right: 10.w),
                                          child: _buildEvent(
                                              1,
                                              index,
                                              controller
                                                  .eventListReady.value[index],
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
                          controller.eventListDone.value.isEmpty
                              ? const SkeletonEvent()
                              : Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15.h),
                                  child: SizedBox(
                                    width: size.width,
                                    height: 150.h,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          controller.eventListDone.value.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(right: 10.w),
                                          child: _buildEvent(
                                              2,
                                              index,
                                              controller
                                                  .eventListDone.value[index],
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
            imageUrl: newsContent.image == null
                ? AppAssets.loadImageNetWork
                : newsContent.image!.pictureUrl ?? AppAssets.loadImageNetWork,
            imageBuilder: (context, imageProvider) {
              return Container(
                margin: EdgeInsets.all(2.r),
                height: size.height.h,
                width: 300.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11.r),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 50.h,
                      width: size.width.w,
                      decoration: BoxDecoration(
                          color: AppColors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.r),
                              bottomRight: Radius.circular(10.r))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  newsContent.newName.toString(),
                                  style: AppStyles.h4.copyWith(
                                      color: AppColors.white,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(FluentIcons.clock_16_regular,
                                            color: AppColors.white,
                                            size: 11.sp),
                                        Text(
                                          "Từ ${newsContent.startTime} - ${newsContent.startDate}",
                                          style: AppStyles.h4.copyWith(
                                              color: AppColors.greyColor,
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(FluentIcons.eye_20_regular,
                                            color: AppColors.white,
                                            size: 11.sp),
                                        Text(
                                          newsContent.numberOfView.toString(),
                                          style: AppStyles.h4.copyWith(
                                              color: AppColors.greyColor,
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
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
