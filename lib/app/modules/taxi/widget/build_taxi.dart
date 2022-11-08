import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/core/utils/number_utils.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/taxi/widget/taxi_dialog.dart';

class BuildTaxi extends StatelessWidget {
  int index;
  ServiceContent serviceContent;
  BuildTaxi({
    Key? key,
    required this.index,
    required this.serviceContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.black,
      borderRadius: BorderRadius.circular(10.r),
      child: InkWell(
        onTap: () {
          const TaxiDialog().showTaxiDialog(context, index, serviceContent);
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
                      imageUrl: "https://i.ibb.co/7tYvdGh/duadonsanbay.jpg",
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
                    // width: size.width.w,
                    child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${serviceContent.name}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            color: AppColors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: serviceContent.status,
                            checkColor: AppColors.green,
                            activeColor: AppColors.background,
                            onChanged: (value) {},
                          ),
                          Text(
                            // "Lựa chọn",
                            serviceContent.status! ? "Đã lựa chọn" : "Lựa chọn",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15.sp,
                                color: AppColors.greyColor),
                          ),
                        ],
                      ),
                      Text(
                        "${serviceContent.description}",
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
                                "${NumberUtils.vnd(serviceContent.price)}",
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
                                "(${NumberUtils.vnd(serviceContent.price)} mỗi phòng)",
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
    );
  }
}
