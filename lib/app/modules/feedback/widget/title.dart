// ignore_for_file: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';

class TitleFeedback extends StatelessWidget {
  String name;
  bool isBig;
  TitleFeedback({
    Key? key,
    this.name = "",
    this.isBig = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: AppStyles.h4.copyWith(
          color: isBig ? AppColors.title : AppColors.white,
          fontSize: isBig ? 20.sp : 15.sp,
          fontWeight: isBig ? FontWeight.bold : FontWeight.normal),
    );
  }
}
