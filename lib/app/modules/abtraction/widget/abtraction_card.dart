// ignore_for_file: must_be_immutable, unused_local_variable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:smarttv_app/app/core/controller/smart_map_controller.dart';
import 'package:smarttv_app/app/core/model/abtraction_content.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/abtraction/widget/abtraction_dialog.dart';
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

  @override
  Widget build(BuildContext context) {
    NavigatorController naController =
        Get.find(tag: (NavigatorController).toString());
    return Material(
      color: AppColors.greyColor,
      borderRadius: BorderRadius.circular(10.r),
      child: InkWell(
        focusColor: AppColors.title,
        borderRadius: BorderRadius.circular(10.r),
        onFocusChange: (value) {
          mapController.moveToPosition(
              LatLng(abtractionContent.latidute ?? 0,
                  abtractionContent.longtitude ?? 0),
              zoom: 16);
        },
        onTap: () {
          const AbtractionDialog()
              .showAbtractionDialog(context, abtractionContent);
        },
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
                child: CachedNetworkImage(
                  imageUrl:
                      "https://toanthaydinh.com/wp-content/uploads/2020/04/hinh-anh-buon.png6_.jpg",
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      height: 120.h,
                      width: 1000.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            topRight: Radius.circular(10.r)),
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
                  "${abtractionContent.name}",
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
                "Giờ mở cửa: Hằng ngày ${abtractionContent.openTime} - ${abtractionContent.closeTime}",
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
