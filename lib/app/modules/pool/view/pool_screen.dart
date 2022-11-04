import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/pool/controller/pool_controller.dart';
import 'package:smarttv_app/app/widget/cached_image.dart';
import 'package:smarttv_app/app/widget/titile_screen.dart';

class PoolScreen extends GetView<PoolController> {
  const PoolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleScreen(
              name: "Hồ bơi",
            ),
            controller.imagePool.value.isEmpty
                ? Container()
                : Expanded(
                    child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Material(
                      color: AppColors.transparent,
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ImageNetwork(
                                    url:
                                        "https://media.istockphoto.com/photos/hot-air-balloons-flying-over-the-botan-canyon-in-turkey-picture-id1297349747?b=1&k=20&m=1297349747&s=170667a&w=0&h=oH31fJty_4xWl_JQ4OIQWZKP8C6ji9Mz7L4XmEnbqRU="
                                            .toString(),
                                    width: 300.w,
                                    height: 180.h),
                                SizedBox(
                                  width: 30.w,
                                ),
                                ImageNetwork(
                                    url:
                                        "https://media.istockphoto.com/photos/hot-air-balloons-flying-over-the-botan-canyon-in-turkey-picture-id1297349747?b=1&k=20&m=1297349747&s=170667a&w=0&h=oH31fJty_4xWl_JQ4OIQWZKP8C6ji9Mz7L4XmEnbqRU="
                                            .toString(),
                                    width: 300.w,
                                    height: 180.h),
                              ],
                            ),
                            SizedBox(
                              height: 30.w,
                            ),
                            SizedBox(
                              width: 500.w,
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: TextStyle(
                                      color: AppColors.white, fontSize: 15.sp),
                                  children: const <TextSpan>[
                                    TextSpan(
                                        text: '5 Men Hotel ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text:
                                            'cung cấp quý khách dịch vụ hồ bơi vô cực nằm trên “nóc”'),
                                    TextSpan(
                                        text:
                                            'của khách sạn là lựa chọn hoàn hảo cho quý khách khi muốn trãi nghiệm cảm giác thư thái khi ngâm mình trong hồ bơi và nhìn toàn cảnh thành phố, nhâm nhi thức uống cùng với người thân.'),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child: Container(
                                width: 200.w,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: AppColors.title, width: 1.w),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "Giờ phục vụ: 8:00 - 20:00",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.greyColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))
          ],
        ),
      ),
    );
  }
}
