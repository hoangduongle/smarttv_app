import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/checkout/controller/checkout_controller.dart';
import 'package:smarttv_app/app/modules/checkout/widget/dialog.dart';
import 'package:smarttv_app/app/widget/titile_screen.dart';

class CheckoutScreen extends GetView<CheckoutController> {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: AppColors.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleScreen(
              name: "Trả phòng nhanh",
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.r),
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://toanthaydinh.com/wp-content/uploads/2020/04/hinh-anh-buon.png6_.jpg",
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            height: 200.h,
                            width: 450.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0.r),
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
                                          bottomLeft: Radius.circular(5.r),
                                          bottomRight: Radius.circular(5.r))),
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
                                      Text(
                                        '''
Nhân viên sẽ đến tận phòng để thực hiên thủ tục
check-out khi quý khách yêu cầu''',
                                        textAlign: TextAlign.center,
                                        style: AppStyles.h4.copyWith(
                                            color: AppColors.white,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.normal),
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
                        borderRadius: BorderRadius.circular(5.r),
                        child: InkWell(
                          focusColor: AppColors.orangeColor,
                          borderRadius: BorderRadius.circular(5.r),
                          onTap: () {
                            const CheckoutDialogWidget()
                                .showCheckoutDialog(context);
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
