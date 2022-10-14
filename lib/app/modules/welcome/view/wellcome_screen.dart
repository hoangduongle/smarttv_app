// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/values/app_assets.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_const.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/welcome/controller/wellcome_controller.dart';
import 'package:smarttv_app/app/modules/welcome/widget/buildImagWelcome.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GetBuilder<WellcomeController>(
      builder: (controller) {
        return controller.url == ""
            ? Container(
                height: size.height.h,
                width: size.width.w,
                decoration: const BoxDecoration(
                  color: AppColors.color1414,
                  image: DecorationImage(
                      image: AssetImage(AppAssets.home_masterWelcome),
                      fit: BoxFit.cover,
                      opacity: 0.2),
                ),
              )
            : Scaffold(
                backgroundColor: AppColors.white,
                body: Container(
                    height: size.height.h,
                    width: size.width.w,
                    decoration: const BoxDecoration(
                      color: AppColors.color1414,
                      image: DecorationImage(
                          image: AssetImage(AppAssets.home_masterWelcome),
                          fit: BoxFit.cover,
                          opacity: 0.2),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    controller.formattedTime.toString(),
                                    style: TextStyle(
                                        fontSize: 25.sp,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: FontFamily.Arvo),
                                  ),
                                  Text(
                                    controller.formattedDate.toString(),
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: FontFamily.Arvo),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.network(controller.url, height: 50),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "${controller.weatherCelsius!.toStringAsFixed(0)} \u2103",
                                    style: TextStyle(
                                        fontSize: 30.sp,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: FontFamily.Arvo),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AppAssets.logoforeground, height: 40),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.h),
                            ),
                            Text(
                              AppConstants.title,
                              style: AppStyles.h1.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: (size.width * 1 / 35).sp),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 35.h),
                          child: Text(
                            'Xin chào buổi chiều @name'.tr,
                            style: AppStyles.h4.copyWith(
                                color: AppColors.white,
                                fontSize: (size.width * 1 / 25).sp),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 35.h),
                          child: Text(
                            'Chúc @name có một kỳ nghỉ tuyệt vời'.tr,
                            style: AppStyles.h4.copyWith(
                                color: AppColors.greyColor,
                                fontSize: (size.width * 1 / 45).sp),
                          ),
                        ),
                        SizedBox(
                          height: 70.h,
                        ),
                        Center(
                          child: CarouselSlider.builder(
                            itemCount: 5,
                            options: CarouselOptions(
                              onPageChanged: (index, reason) {},
                              enableInfiniteScroll: true,
                              initialPage: 0,
                              disableCenter: true,
                              height: (size.height * 7 / 30).h,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                              viewportFraction: .2,
                            ),
                            itemBuilder: (context, index, realIndex) {
                              return buildImageWelcome(size, index, context);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15.r),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 60.w,
                              ),
                              Text(
                                'Địa điểm'.tr,
                                style: AppStyles.h4.copyWith(
                                    color: AppColors.white,
                                    fontSize: (size.width * 1 / 45).sp),
                              ),
                              SizedBox(
                                width: 80.w,
                              ),
                              Text(
                                'Khuyến mãi'.tr,
                                style: AppStyles.h4.copyWith(
                                    color: AppColors.white,
                                    fontSize: (size.width * 1 / 45).sp),
                              ),
                              SizedBox(
                                width: 95.w,
                              ),
                              Text(
                                'Trang chủ'.tr,
                                style: AppStyles.h4.copyWith(
                                    color: AppColors.white,
                                    fontSize: (size.width * 1 / 45).sp),
                              ),
                              SizedBox(
                                width: 110.w,
                              ),
                              Text(
                                'Dịch vụ'.tr,
                                style: AppStyles.h4.copyWith(
                                    color: AppColors.white,
                                    fontSize: (size.width * 1 / 45).sp),
                              ),
                              SizedBox(
                                width: 125.w,
                              ),
                              Text(
                                'Sự kiện'.tr,
                                style: AppStyles.h4.copyWith(
                                    color: AppColors.white,
                                    fontSize: (size.width * 1 / 45).sp),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              );
      },
    );
  }
}
