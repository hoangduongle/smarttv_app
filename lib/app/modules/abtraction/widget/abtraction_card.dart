// ignore_for_file: must_be_immutable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import 'package:smarttv_app/app/core/controller/smart_map_controller.dart';
import 'package:smarttv_app/app/core/model/abtraction_content.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/main/navigation/navigator_controller.dart';

class AbtractionCard extends StatelessWidget {
  AbtractionContent abtractionContent;
  int index;
  SmartMapController mapController;
  AbtractionCard({
    Key? key,
    required this.abtractionContent,
    required this.index,
    required this.mapController,
  }) : super(key: key);

/*
          mapController
              .moveToPosition(LatLng(10.845259719568647, 106.8201004328285));


 */

  @override
  Widget build(BuildContext context) {
    NavigatorController naController =
        Get.find(tag: (NavigatorController).toString());
    Size size = MediaQuery.of(context).size;
    return Material(
      color: AppColors.greyColor,
      borderRadius: BorderRadius.circular(10.r),
      child: InkWell(
        focusColor: AppColors.title,
        borderRadius: BorderRadius.circular(10.r),
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(2.r),
          width: 400.w,
          height: 200.h,
          decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(10.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://toanthaydinh.com/wp-content/uploads/2020/04/hinh-anh-buon.png6_.jpg",
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      height: 120.h,
                      width: 1000.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Text(
                  "${abtractionContent.name}", // ${abtractionContent.name}
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp,
                      color: AppColors.white),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Giờ mở cửa: Hằng ngày 08:00 - 19:00",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp,
                    color: AppColors.greyColor),
              ),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
