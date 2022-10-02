// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_local_variable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smarttv_app/app/modules/main/navigation/navigator_controller.dart';
import 'package:smarttv_app/app/values/app_colors.dart';

Widget SkeletonLoadingServiceScreen() {
  NavigatorController naController =
      Get.find(tag: (NavigatorController).toString());
  Size size = MediaQuery.of(Get.context!).size;
  return Expanded(
    child: SizedBox(
      width: size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: GridView.builder(
          itemCount: 8,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: naController.select ? 3 : 4,
            crossAxisSpacing: 50,
            mainAxisSpacing: 30,
          ),
          itemBuilder: (context, index) {
            return CardCategorySkeleton();
          },
        ),
      ),
    ),
  );
}

Widget CardCategorySkeleton() {
  NavigatorController naController =
      Get.find(tag: (NavigatorController).toString());
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Card(
      color: AppColors.navigabackground,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 8),
                margin: EdgeInsets.all(10),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.white,
                  period: Duration(milliseconds: 1500),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        Container(
                          width: naController.select ? 175 : 148, //150 //178
                          height: naController.select ? 110 : 90, //90 //110
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.white,
                period: Duration(milliseconds: 1500),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 25,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
