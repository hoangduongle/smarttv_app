// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

Widget SkeletonLoadingHomeScreen() {
  Size size = MediaQuery.of(Get.context!).size;
  return Center(
    child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0.w),
        child: Column(children: [
          Center(
            child: CarouselSlider.builder(
              options: CarouselOptions(
                height: (size.height * 7 / 10).h,
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
        ])),
  );
}

Widget buildImageSkeleton() {
  return Container(
    padding: EdgeInsets.only(top: 8.h),
    child: Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.white,
      period: Duration(milliseconds: 1500),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.h),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
        child: Row(
          children: [
            Container(
              width: 720.w,
              height: 540,
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
