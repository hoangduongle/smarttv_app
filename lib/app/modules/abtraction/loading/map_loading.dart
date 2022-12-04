import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';

class MapLoading extends StatelessWidget {
  const MapLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        padding: EdgeInsets.all(10.r),
        child: Shimmer.fromColors(
          baseColor: AppColors.greyColor.withOpacity(0.5),
          highlightColor: AppColors.white,
          period: const Duration(milliseconds: 1500),
          child: Container(
            height: 500.h,
            width: 500.w,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.greyColor),
          ),
        ),
      ),
    );
  }
}
