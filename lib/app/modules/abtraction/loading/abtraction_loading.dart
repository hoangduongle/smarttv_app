import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';

class AbtractionLoading extends StatelessWidget {
  const AbtractionLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 15.h,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            padding: EdgeInsets.only(
              top: 20.h,
              left: 20.w,
              right: 20.w,
            ),
            child: SizedBox(
              height: 180.h,
              child: Material(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(5.r),
                child: Container(
                    margin: EdgeInsets.all(1.5.r),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 15.w),
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.white,
                                period: Duration(milliseconds: 1500),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 180.w,
                                      height: 150.h,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                              width: 960.w,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 10.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Shimmer.fromColors(
                                      baseColor: Colors.grey.shade300,
                                      highlightColor: Colors.white,
                                      period: Duration(milliseconds: 1500),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 180.w,
                                            height: 25.h,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(5.r),
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Shimmer.fromColors(
                                      baseColor: Colors.grey.shade300,
                                      highlightColor: Colors.white,
                                      period: Duration(milliseconds: 1500),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 490.w,
                                            height: 65.h,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(5.r),
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Shimmer.fromColors(
                                      baseColor: Colors.grey.shade300,
                                      highlightColor: Colors.white,
                                      period: Duration(milliseconds: 1500),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 180.w,
                                            height: 25.h,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(5.r),
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Shimmer.fromColors(
                                      baseColor: Colors.grey.shade300,
                                      highlightColor: Colors.white,
                                      period: Duration(milliseconds: 1500),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 350.w,
                                            height: 25.h,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(5.r),
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}
