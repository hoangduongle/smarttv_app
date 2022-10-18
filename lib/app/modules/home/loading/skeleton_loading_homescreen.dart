// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget SkeletonLoadingHomeScreen() {
  Size size = MediaQuery.of(Get.context!).size;
  return Center(
    child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0.w),
        child: Column(children: [
          Center(
            child: CarouselSlider.builder(
              options: CarouselOptions(
                height: (size.height * 7 / 9).h,
                viewportFraction: 1,
                initialPage: 0,
                autoPlay: false,
              ),
              itemCount: 1,
              itemBuilder: (context, index, realIndex) {
                return buildImageSkeleton();
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: buildIndicatorSkeleton(0),
          ),
        ])),
  );
}

Widget buildImageSkeleton() {
  Size size = MediaQuery.of(Get.context!).size;
  return Container(
    padding: EdgeInsets.only(top: 8.h),
    child: Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.white,
      period: Duration(milliseconds: 1500),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
        child: Row(
          children: [
            Container(
              width: (735).w,
              height: 540.h,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15.r),
                  color: Colors.grey),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildIndicatorSkeleton(int currentIndex) {
  return AnimatedSmoothIndicator(
    curve: Curves.easeInOut,
    activeIndex: currentIndex,
    count: 4,
    effect: const SlideEffect(
        spacing: 30,
        dotColor: AppColors.greyColor,
        activeDotColor: AppColors.focus),
  );
}
