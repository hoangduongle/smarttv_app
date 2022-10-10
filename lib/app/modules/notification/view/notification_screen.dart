import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void openDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        Size size = MediaQuery.of(context).size;
        return Dialog(
          elevation: 5,
          backgroundColor: AppColors.navigabackground,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          child: SafeArea(
              child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: EdgeInsets.only(top: 20.h),
                width: size.width.w - 80.w,
                child: Text(
                  "Thông báo",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.sp,
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
          )),
        );
      },
    );
  }
}
