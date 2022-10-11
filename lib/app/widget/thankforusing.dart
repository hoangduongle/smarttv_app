import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import 'package:smarttv_app/app/core/values/app_colors.dart';

class ThankCustomer extends StatelessWidget {
  const ThankCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void showThanksDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        // Size size = MediaQuery.of(context).size;
        return Dialog(
          elevation: 5,
          backgroundColor: AppColors.navigabackground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: 450.w,
              height: 250.h,
              child: Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  // SvgPicture.asset(

                  //   "assets/svg/thankcustomer.svg",
                  // ),
                  Container(
                    padding: EdgeInsets.only(top: 10.h),
                    width: 800.w,
                    child: Text(
                      "Cảm ơn quý khách đã sử dụng dịch vụ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.title),
                    ),
                  ),
                  const Divider(
                    indent: 40,
                    endIndent: 40,
                    color: AppColors.greyColor,
                    thickness: 1,
                  ),
                  Container(
                    child:
                        Lottie.asset("assets/lotties/love.json", height: 140),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 00.h),
                    width: 800.w,
                    child: Text(
                      "Chúc quý khách một ngày vui vẻ, hạnh phúc",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.greyColor),
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
