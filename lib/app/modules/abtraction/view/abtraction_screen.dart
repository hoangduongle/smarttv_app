// ignore_for_file: use_key_in_widget_constructors, unused_local_variable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/abtraction/controller/abtraction_controller.dart';
import 'package:smarttv_app/app/modules/abtraction/loading/abtraction_loading.dart';
import 'package:smarttv_app/app/modules/abtraction/widget/abtraction_card.dart';
import 'package:smarttv_app/app/widget/titile_screen.dart';

class AbtractionScreen extends GetView<AbtractionController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScrollController scrollControllerAbtraction = ScrollController();
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleScreen(name: "local".tr),
                  controller.abtractions.value.isEmpty
                      ? const AbtractionLoading()
                      : Expanded(
                          flex: 5,
                          child: RawScrollbar(
                            thumbColor: AppColors.white,
                            thumbVisibility: true,
                            radius: Radius.circular(100.r),
                            thickness: 10,
                            controller: scrollControllerAbtraction,
                            child: ListView.separated(
                              controller: scrollControllerAbtraction,
                              separatorBuilder: (context, index) => SizedBox(
                                height: 15.h,
                              ),
                              itemCount: controller.abtractions.value.length,
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
                                      child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                          focusColor: AppColors.title,
                                          autofocus: index == 0,
                                          onTap: () {},
                                          child: Container(
                                              margin: EdgeInsets.all(1.5.r),
                                              decoration: BoxDecoration(
                                                color: AppColors.background,
                                                borderRadius:
                                                    BorderRadius.circular(5.r),
                                              ),
                                              child: AbtractionCard(
                                                  abtractionContent: controller
                                                      .abtractions.value[index],
                                                  index: index))),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ));
  }
}
/*
Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 42.h, left: 15.w),
                  child: Text(
                    "local".tr,
                    style: AppStyles.h4.copyWith(
                        color: AppColors.header,
                        fontSize: (size.width * 25 / 1000).sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                    padding: EdgeInsets.all(8.r),
                    width: 750.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.45),
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Text(
                      "Ngoài những dịch vụ sẵn có, khách sạn còn cung cấp cho quý khách các địa điểm được nhiều khách hàng trước đó trãi nghiệm và đánh giá cao. Từ những địa điểm này mong ràng quý khách có được thời gian trải nghiệm tuyệt với tại khách sạn của chúng tôi.",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ),
                ),

                ////////////////////
              ],
            )
 */
