import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/main/navigation/navigator_controller.dart';

class PromotionLoading extends StatelessWidget {
  const PromotionLoading({super.key});

  @override
  Widget build(BuildContext context) {
    NavigatorController naController =
        Get.find(tag: (NavigatorController).toString());
    return Expanded(
        child: Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          width: MediaQuery.of(context).size.width.w,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: GridView.builder(
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: naController.select ? 2 : 3,
                crossAxisSpacing: 40.w,
                mainAxisExtent: 300,
                mainAxisSpacing: 30.h,
              ),
              itemBuilder: (context, index) {
                return Container(
                    decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(5.r)),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
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
                                    width: naController.select ? 316.w : 245.w,
                                    height: 200.h,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular(5.r),
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
                                    width: naController.select ? 295.w : 225.w,
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
                                    width: naController.select ? 200.w : 180.w,
                                    height: 20.h,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular(5.r),
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
                                    width: naController.select ? 250.w : 220.w,
                                    height: 20.h,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ));
              },
            ),
          ),
        ),
      ),
    ));
  }
}
