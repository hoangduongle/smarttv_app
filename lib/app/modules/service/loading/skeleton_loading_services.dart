// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_local_variable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smarttv_app/app/modules/main/navigation/navigator_controller.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';

class SkeletonCategoryService extends StatelessWidget {
  const SkeletonCategoryService({super.key});

  @override
  Widget build(BuildContext context) {
    NavigatorController naController =
        Get.find(tag: (NavigatorController).toString());
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: SizedBox(
        width: size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: naController.select ? 15.w : 30.w, vertical: 0.h),
          child: GridView.builder(
            itemCount: 8,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: naController.select ? 3 : 4,
              crossAxisSpacing: naController.select ? 50.w : 30.w,
              mainAxisSpacing: 30.h,
            ),
            itemBuilder: (context, index) {
              return CardCategorySkeleton();
            },
          ),
        ),
      ),
    );
  }
}

class CardCategorySkeleton extends StatelessWidget {
  const CardCategorySkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    NavigatorController naController =
        Get.find(tag: (NavigatorController).toString());
    return Material(
      color: AppColors.transparent,
      child: Container(
        padding: EdgeInsets.only(bottom: 0.h),
        child: Stack(
          children: [
            SizedBox(
              height: (size.height).h,
              width: size.width.w,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.white,
                    period: Duration(milliseconds: 1500),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150.w,
                          height: 25.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(5.r),
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  )),
            ),
            Align(
                alignment: Alignment.topCenter,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.white,
                  period: Duration(milliseconds: 1500),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200.w,
                        height: naController.select ? 180.h : 160.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5.r),
                            color: Colors.grey),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
