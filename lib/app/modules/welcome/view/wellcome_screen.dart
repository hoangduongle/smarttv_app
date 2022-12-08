// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api, unused_local_variable

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
  const WelcomePage({
    Key? key,
  }) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  WellcomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<WellcomeController>(
      builder: (controller) {
        return Scaffold(
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
                              ),
                            ),
                          ],
                        ),
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
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35.sp,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 35.h),
                    child: Text(
                      controller.title.trim(),
                      style: AppStyles.h4
                          .copyWith(color: AppColors.white, fontSize: 40.sp),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 35.h),
                    child: Text(
                      controller.content.trim(),
                      style: AppStyles.h4.copyWith(
                          color: AppColors.greyColor, fontSize: 20.sp),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  SizedBox(
                    width: size.width.w,
                    height: 200.h,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(horizontal: 85.w),
                        itemBuilder: (context, index) {
                          return WellcomeBuild(index: index);
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              width: 40.w,
                            ),
                        itemCount: 5),
                  )
                ],
              )),
        );
      },
    );
  }
}
