// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/values/app_assets.dart';
import 'package:smarttv_app/app/values/app_colors.dart';
import 'package:smarttv_app/app/values/app_const.dart';
import 'package:smarttv_app/app/values/app_styles.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    // _navigateToHomePage();
  }

  // _navigateToHomePage() async {
  //   await Future.delayed(const Duration(seconds: 4), () {});
  //   Get.offNamed('/mainscreen');
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        height: size.height.h,
        width: size.width.w,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.home_master),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: (size.height * 3 / 5).h,
              width: (size.width * 2 / 3).w,
              decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.45),
                  borderRadius: BorderRadius.circular(12.r)),
              child: Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: (size.width * 0.1).w,
                              vertical: 24.0.h),
                          child: Text(
                            AppConstants.title,
                            style: AppStyles.h1.copyWith(
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: (size.width * 1 / 12).sp),
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 4.0.h),
                        child: Text(
                          'welcome'.tr,
                          style: AppStyles.h4.copyWith(
                              color: Colors.black87,
                              fontSize: (size.width * 1 / 30).sp),
                        ),
                      )),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.h)),
            SizedBox(
              width: 210.w,
              height: 50.h,
              child: Material(
                color: AppColors.focus,
                borderRadius: BorderRadius.circular(10.r),
                elevation: 0,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  autofocus: true,
                  focusColor: AppColors.orangeColor,
                  onTap: () {
                    Get.offNamed('/mainscreen');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Bấm để chuyển tiếp'.tr,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
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
    );
  }
}
