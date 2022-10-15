import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:smarttv_app/app/modules/event/controller/event_controller.dart';
import 'package:smarttv_app/app/modules/event/widget/build_image_event.dart';

import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';

class EventScreen extends GetView<EventController> {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          color: AppColors.background,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 42.h, left: 15.w),
                child: Row(
                  children: [
                    Text("event".tr,
                        style: AppStyles.h4.copyWith(
                            color: AppColors.header,
                            fontSize: (size.width * 25 / 1000).sp,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                child: Text("Sắp diễn ra",
                    style: AppStyles.h4.copyWith(
                        color: AppColors.header,
                        fontSize: (size.width * 25 / 1000).sp,
                        fontWeight: FontWeight.bold)),
              ),
              Center(
                child: CarouselSlider.builder(
                  itemCount: 3,
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {},
                    enableInfiniteScroll: false,
                    initialPage: 0,
                    height: (size.height * 7 / 20).h,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    viewportFraction: .7,
                  ),
                  itemBuilder: (context, index, realIndex) {
                    return buildImageEvent(size, index, context);
                  },
                ),
              ),
              Container(
                child: Text("Đang diễn ra",
                    style: AppStyles.h4.copyWith(
                        color: AppColors.header,
                        fontSize: (size.width * 25 / 1000).sp,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          )),
    );
  }
}
/*

 */