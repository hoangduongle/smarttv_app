// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/navigation/controller/navigator_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget SkeletonLoadingHomeScreen() {
  Size size = MediaQuery.of(Get.context!).size;

  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0.w),
      child: Column(children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: (size.height * 7 / 9).h,
            viewportFraction: 1,
            initialPage: 0,
            autoPlay: false,
          ),
          itemCount: 1,
          itemBuilder: (context, index, realIndex) {
            return Material(
                color: AppColors.transparent,
                child: InkWell(
                    // onTap: () {},
                    focusColor: AppColors.transparent,
                    child: buildImageSkeleton()));
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: buildIndicatorSkeleton(),
        ),
      ]));
}

Widget buildImageSkeleton() {
  NavigatorController naController =
      Get.find(tag: (NavigatorController).toString());
  return Padding(
    padding: EdgeInsets.only(top: 8.h),
    child: Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.white,
      period: Duration(milliseconds: 1500),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: naController.select ? 730.w : 870.w, //735
          height: 400.h, //540
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.grey),
        ),
      ),
    ),
  );
}

Widget buildIndicatorSkeleton() {
  return AnimatedSmoothIndicator(
    curve: Curves.easeInOut,
    activeIndex: 0,
    count: 4,
    effect: const SlideEffect(
        spacing: 30,
        dotColor: AppColors.greyColor,
        activeDotColor: AppColors.focus),
  );
}
