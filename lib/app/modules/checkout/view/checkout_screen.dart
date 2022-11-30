import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/checkout/controller/checkout_controller.dart';
import 'package:smarttv_app/app/widget/titile_screen.dart';

class CheckoutScreen extends GetView<CheckoutController> {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleScreen(
              name: "Trả phòng nhanh",
            ),
            // controller.imageCheckout.value.isEmpty? Container():
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://i.ibb.co/ncYW3V4/checkout.jpg", //${controller.imageCheckout.value[0].pictureUrl}
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            height: 200.h,
                            width: 450.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 200.h,
                                  width: 450.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.black.withOpacity(0.5),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.r),
                                          bottomRight: Radius.circular(10.r))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Check-out",
                                        style: AppStyles.h4.copyWith(
                                            color: AppColors.white,
                                            fontSize: 25.sp,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      SizedBox(
                                        height: 30.h,
                                      ),
                                      SizedBox(
                                        width: 330.w,
                                        child: Text(
                                          "Nhân viên sẽ đến tận phòng để thực hiện thủ tục \ncheck-out khi quý khách yêu cầu",
                                          textAlign: TextAlign.center,
                                          style: AppStyles.h4.copyWith(
                                              color: AppColors.white,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    SizedBox(
                      width: 200.w,
                      height: 40.h,
                      child: Material(
                        color: AppColors.focus,
                        borderRadius: BorderRadius.circular(10.r),
                        child: InkWell(
                          focusColor: AppColors.orangeColor,
                          borderRadius: BorderRadius.circular(10.r),
                          onTap: () {
                            // FeedbackController feedbackController = Get.find();
                            // feedbackController.insertAllFeedback();
                            controller.requestCheckout();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Check-out tại phòng',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                    color: AppColors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
