import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/taxi/controller/taxi_controller.dart';
import 'package:smarttv_app/app/modules/taxi/widget/build_taxi.dart';
import 'package:smarttv_app/app/widget/titile_screen.dart';

class TaxiScreen extends GetView<TaxiController> {
  const TaxiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // NavigatorController naController =
    //     Get.find(tag: (NavigatorController).toString());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: AppColors.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleScreen(
              name: "Đưa đón sân bay",
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
              width: size.width,
              child: ListView.separated(
                itemCount: controller.taxiContent.value.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: 15.h,
                ),
                itemBuilder: (context, index) {
                  return BuildTaxi(
                    index: index,
                    serviceContent: controller.taxiContent.value[index],
                  );
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
}
