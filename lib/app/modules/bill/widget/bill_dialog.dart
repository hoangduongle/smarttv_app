import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/momo/view/momo_screen.dart';
import 'package:smarttv_app/app/modules/receptionist/view/receptionist_screen.dart';

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
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          child: SizedBox(
            width: 700.w,
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
                  indent: 150,
                  endIndent: 150,
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
                        focusColor: AppColors.title,
                        borderRadius: BorderRadius.circular(15.r),
                        onTap: () {
                          debugPrint("Payment Method: MoMo");
                          Get.back();
                          const MomoScreen().MomoDialog(context);
                        },
                        child: SvgPicture.asset("assets/svg/momo.svg",
                            height: 150),
                      ),
                      SizedBox(
                        width: 40.h,
                      ),
                      InkWell(
                        focusColor: AppColors.title,
                        borderRadius: BorderRadius.circular(15.r),
                        onTap: () {
                          debugPrint("Payment Method: MoMo");
                        },
                        child: SvgPicture.asset("assets/svg/momo.svg",
                            color: AppColors.navigabackground, height: 150),
                      ),
                      SizedBox(
                        width: 40.h,
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(15.r),
                        focusColor: AppColors.title,
                        onTap: () {
                          debugPrint("Payment Method: Lễ Tân");
                          Get.back();
                          const ReceptionistScreen()
                              .receptionistDialog(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(2.r),
                          margin: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 4.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0.r),
                              color: AppColors.navigabackground),
                          child: SvgPicture.asset("assets/svg/receptionist.svg",
                              color: AppColors.white.withOpacity(.8),
                              height: 140),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 125.w, vertical: 10.h),
                  child: Row(
                    children: [
                      Text(
                        "Momo",
                        style: TextStyle(
                            color: AppColors.title,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 135.h,
                      ),
                      Text(
                        "Banking",
                        style: TextStyle(
                            color: AppColors.title,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 125.h,
                      ),
                      Text(
                        "Lễ tân",
                        style: TextStyle(
                            color: AppColors.title,
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
                  child: FloatingActionButton.extended(
                    heroTag: "btn2",
                    label: Text(
                      "back".tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: AppColors.black),
                    ),
                    icon: Icon(
                      Icons.arrow_back,
                      size: 25.r,
                      color: AppColors.black,
                    ),
                    backgroundColor: AppColors.green,
                    elevation: 1,
                    focusElevation: 2,
                    focusColor: AppColors.greenFocus,
                    onPressed: () {
                      Get.back();
                    },
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
