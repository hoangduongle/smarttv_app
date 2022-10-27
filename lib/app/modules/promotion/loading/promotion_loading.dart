import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';

class PromotionLoading extends StatelessWidget {
  const PromotionLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
      width: MediaQuery.of(context).size.width.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 0.h),
        child: GridView.builder(
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 40.w,
            mainAxisExtent: 300,
            mainAxisSpacing: 30.h,
          ),
          itemBuilder: (context, index) {
            return Material(
              color: AppColors.transparent,
              child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(5.r)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.white,
                          period: const Duration(milliseconds: 1500),
                          child: Row(
                            children: [
                              Container(
                                width: 316.w,
                                height: 200.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.white,
                          period: const Duration(milliseconds: 1500),
                          child: Row(
                            children: [
                              Container(
                                width: 295.w,
                                height: 25.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.white,
                          period: const Duration(milliseconds: 1500),
                          child: Row(
                            children: [
                              Container(
                                width: 200.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.white,
                          period: const Duration(milliseconds: 1500),
                          child: Row(
                            children: [
                              Container(
                                width: 250.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            );
          },
        ),
      ),
    ));
  }
}
