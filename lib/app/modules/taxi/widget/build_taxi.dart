// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/core/utils/number_utils.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/taxi/controller/taxi_controller.dart';
import 'package:smarttv_app/app/modules/taxi/widget/taxi_dialog.dart';

class BuildTaxi extends StatefulWidget {
  int index;

  ServiceContent serviceContent;
  BuildTaxi({
    Key? key,
    required this.index,
    required this.serviceContent,
  }) : super(key: key);

  @override
  State<BuildTaxi> createState() => _BuildTaxiState();
}

class _BuildTaxiState extends State<BuildTaxi> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaxiController>(
      builder: (controller) => Material(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(10.r),
        child: InkWell(
          onTap: () {
            const TaxiDialog().showTaxiDialog(
              context,
              widget.index,
              widget.serviceContent,
              controller,
            );
          },
          focusColor: AppColors.title,
          borderRadius: BorderRadius.circular(10.r),
          child: Container(
            margin: EdgeInsets.all(2.r),
            height: 180.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.navigabackground,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: CachedNetworkImage(
                        imageUrl:
                            "${widget.serviceContent.image![0].pictureUrl}",
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            height: 135.h,
                            width: 180.w,
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
                  ),
                  SizedBox(
                      child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.serviceContent.name}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                              color: AppColors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(0.r, 15.r, 10.r, 15.r),
                              child: Material(
                                borderRadius: BorderRadius.circular(2.r),
                                color: AppColors.greyColor,
                                child: Container(
                                  margin: EdgeInsets.all(1.r),
                                  width: 25.w,
                                  height: 25.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.black,
                                      borderRadius: BorderRadius.circular(2.r)),
                                  child: controller.statusTaxi[widget.index]
                                      ? Icon(FluentIcons.checkmark_12_filled,
                                          color: AppColors.green, size: 25.sp)
                                      : Container(),
                                ),
                              ),
                            ),
                            Text(
                              controller.statusTaxi[widget.index]
                                  ? "Đã lựa chọn"
                                  : "Lựa chọn",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15.sp,
                                  color: AppColors.greyColor),
                            ),
                          ],
                        ),
                        Text(
                          "${widget.serviceContent.description}",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15.sp,
                              color: AppColors.greyColor),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          height: 20.h,
                          child: Row(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  NumberUtils.vnd(widget.serviceContent.price),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp,
                                      color: AppColors.white),
                                ),
                              ),
                              SizedBox(
                                width: 10.h,
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "(${NumberUtils.vnd(widget.serviceContent.price)} mỗi phòng)",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 10.sp,
                                      color: AppColors.greyColor),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
