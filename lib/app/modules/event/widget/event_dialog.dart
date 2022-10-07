
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';

class EventDialog extends StatelessWidget {
  const EventDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void showEventDialog(BuildContext context, int index) {
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
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 800.w,
            height: 400.h,
            child: Row(
              // mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 20.h),
                      width: 800.w,
                      child: Text(
                        "Hoi cho dia phuong $index",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.sp,
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
