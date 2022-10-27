// ignore_for_file: must_be_immutable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/model/abtraction_content.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/main/navigation/navigator_controller.dart';

class AbtractionCard extends StatelessWidget {
  AbtractionContent abtractionContent;
  int index;
  AbtractionCard({
    Key? key,
    required this.abtractionContent,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigatorController naController =
        Get.find(tag: (NavigatorController).toString());
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.r),
              child: CachedNetworkImage(
                imageUrl:
                    "https://toanthaydinh.com/wp-content/uploads/2020/04/hinh-anh-buon.png6_.jpg",
                imageBuilder: (context, imageProvider) {
                  return Container(
                    height: 150.h,
                    width: 180.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0.r),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
              width: size.width.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${++index}. ${abtractionContent.name}",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18.sp,
                          color: AppColors.white),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      width: naController.select ? 490.w : 650.w,
                      height: 65.h,
                      child: Text(
                        "${abtractionContent.description}",
                        maxLines: 4,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 13.sp,
                            color: AppColors.greyColor),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Giờ mở cửa: Hàng ngày ${abtractionContent.openTime} - ${abtractionContent.closeTime}",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 13.sp,
                          color: AppColors.greyColor),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "${abtractionContent.address}",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 13.sp,
                          color: AppColors.greyColor),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
