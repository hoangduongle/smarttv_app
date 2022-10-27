import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/event/controller/event_controller.dart';

import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/event/loading/skeleton_event.dart';
import 'package:smarttv_app/app/modules/event/widget/build_event.dart';

import 'package:smarttv_app/app/modules/event/widget/title_event.dart';
import 'package:smarttv_app/app/widget/titile_screen.dart';

class EventScreen extends GetView<EventController> {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(body: Obx(
      () {
        return Container(
            color: AppColors.background,
            child: Column(
              children: [
                TitleScreen(
                  name: "event".tr,
                ),
                // Padding(
                //     padding: EdgeInsets.fromLTRB(30.w, 10.h, 0.w, 10.h),
                //     child: TitleEvent(name: "Đang diễn ra")),
                //================================================================
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30.w, 10.h, 30.w, 0.h),
                      child: Column(
                        children: [
                          TitleEvent(name: "Đang diễn ra", indexType: 0),
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
                                          child: BuildEvent(
                                              indexType: 0,
                                              index: index,
                                              eventContent: controller
                                                  .eventList.value[index],
                                              controller: controller),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                          //================================================================
                          TitleEvent(name: "Sắp diễn ra", indexType: 1),
                          controller.eventListReady.value.isEmpty
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
                                          child: BuildEvent(
                                              indexType: 1,
                                              index: index,
                                              eventContent: controller
                                                  .eventList.value[index],
                                              controller: controller),
                                        );
                                      },
                                    ),
                                  ),
                                ),

                          //================================================================

                          // TitleEvent(name: "Đã diễn ra", indexType: 2),
                          // Padding(
                          //   padding: EdgeInsets.symmetric(vertical: 15.h),
                          //   child: SizedBox(
                          //     width: size.width,
                          //     height: 150.h,
                          //     child: ListView.builder(
                          //       shrinkWrap: true,
                          //       itemCount: controller.eventList.value.length,
                          //       scrollDirection: Axis.horizontal,
                          //       itemBuilder: (context, index) {
                          //         return Padding(
                          //           padding: EdgeInsets.only(right: 10.w),
                          //           child: BuildEvent(
                          //               indexType: 2,
                          //               index: index,
                          //               eventContent:
                          //                   controller.eventList.value[index],
                          //               controller: controller),
                          //         );
                          //       },
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ));
      },
    ));
  }
}
/*

 */
