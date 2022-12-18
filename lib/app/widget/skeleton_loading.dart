// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_local_variable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smarttv_app/app/modules/navigation/controller/navigator_controller.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';

Widget SkeletonLoadingServiceConponentScreen() {
  Size size = MediaQuery.of(Get.context!).size;
  return Expanded(
    child: SizedBox(
      width: size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: GridView.builder(
          itemCount: 15,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 180,
            crossAxisCount: 5,
            crossAxisSpacing: 0.w,
            mainAxisSpacing: 16.h,
          ),
          itemBuilder: (context, index) {
            return CardServiceSkeleton();
          },
        ),
      ),
    ),
  );
}

Widget CardServiceSkeleton() {
  NavigatorController naController =
      Get.find(tag: (NavigatorController).toString());
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Card(
      color: AppColors.navigabackground,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 8.h),
                margin: EdgeInsets.all(10.r),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.white,
                  period: Duration(milliseconds: 1500),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Row(
                      children: [
                        Container(
                          width: 148, //150 //178
                          height: 90, //90 //110
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10.r),
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.white,
                period: Duration(milliseconds: 1500),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
