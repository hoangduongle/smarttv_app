import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/momo/view/momo_screen.dart';

class BillDialog extends StatelessWidget {
  const BillDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void showBillDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        // Size size = MediaQuery.of(context).size;
        return Dialog(
          elevation: 5,
          backgroundColor: AppColors.navigabackground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          child: SizedBox(
            width: 500.w,
            height: 360.h,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 30.h),
                  width: 800.w,
                  child: Text(
                    "Phương thức thanh toán",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.title),
                  ),
                ),
                const Divider(
                  indent: 100,
                  endIndent: 100,
                  thickness: .5,
                  color: AppColors.white,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 80.w, vertical: 10.h),
                  child: Row(
                    children: [
                      InkWell(
                        autofocus: true,
                        focusColor: AppColors.orangeColor,
                        borderRadius: BorderRadius.circular(10.r),
                        onTap: () {
                          debugPrint("Payment Method: MoMo");
                          Get.back();
                          const MomoScreen().MomoDialog(context);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: SvgPicture.asset("assets/svg/momo.svg",
                              height: 150),
                        ),
                      ),
                      SizedBox(
                        width: 40.h,
                      ),
                      InkWell(
                        focusColor: AppColors.orangeColor,
                        borderRadius: BorderRadius.circular(10.r),
                        onTap: () {
                          debugPrint("Payment Method: VNPay");
                        },
                        child: Container(
                          margin: EdgeInsets.all(3.r),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: SvgPicture.asset("assets/svg/vnpay.svg",
                                height: 140),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 125.w, vertical: 8.h),
                  child: Row(
                    children: [
                      Text(
                        "Momo",
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 130.h,
                      ),
                      Text(
                        "VNPay",
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 05.h,
                ),
                SizedBox(
                  height: 35.h,
                  width: 120.w,
                  child: Material(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(10.r),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10.r),
                      focusColor: AppColors.greenFocus,
                      onTap: () {
                        Get.back();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            size: 20.r,
                            color: AppColors.black,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            'back'.tr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
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
      },
    );
  }
}
