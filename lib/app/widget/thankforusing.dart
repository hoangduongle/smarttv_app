import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            width: 800.w,
            height: 450.h,
            child: Row(
              // mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  // mainAxisSize: MainAxisSize.max,

                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    // SvgPicture.asset(

                    //   "assets/svg/thankcustomer.svg",
                    // ),
                    Container(
                      padding: EdgeInsets.only(top: 20.h),
                      width: 800.w,
                      child: Text(
                        "Cảm ơn quý khách đã sử dụng dịch vụ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.title),
                      ),
                    ),
                    Divider(
                      color: AppColors.white,
                      height: 20.h,
                      thickness: 5,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20.h),
                      width: 800.w,
                      child: Text(
                        "Chúc quý khách một ngày vui vẻ, hạnh phúc",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.title),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
