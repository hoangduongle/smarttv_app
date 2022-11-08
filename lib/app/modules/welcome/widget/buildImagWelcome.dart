// ignore_for_file: prefer_interpolation_to_compose_strings, unnecessary_brace_in_string_interps, file_names, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/core/values/app_styles.dart';
import 'package:smarttv_app/app/modules/main/navigation/navigator_controller.dart';
import 'package:smarttv_app/app/modules/welcome/controller/wellcome_controller.dart';

class WellcomeBuild extends StatefulWidget {
  int index;
  WellcomeBuild({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<WellcomeBuild> createState() => _WellcomeBuildState();
}

class _WellcomeBuildState extends State<WellcomeBuild> {
  var isFocus = [false, false, true, false, false];
  var image = [
    "https://i.ibb.co/L69PWnr/local.png",
    "https://i.ibb.co/F3FN8vx/promotion.png",
    "https://i.ibb.co/hCf5LTX/homepage.jpg",
    "https://i.ibb.co/pxdphfN/service.jpg",
    "https://i.ibb.co/NKzWxKQ/event.jpg",
  ];
  var name = ["Địa điểm", "Tin tức", "Trang chủ", "Dịch vụ", "Sự kiện"];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    NavigatorController naController =
        Get.find(tag: (NavigatorController).toString());
    WellcomeController controller = Get.find();

    return InkWell(
      autofocus: widget.index == 2,
      onFocusChange: (value) {
        setState(() {
          isFocus[widget.index] = value;
        });
      },
      onTap: () {
        switch (widget.index) {
          case 0: // abtraction
            controller.stopAudio();
            naController.current_index = 3.obs;
            Get.toNamed('/mainscreen');
            break;
          case 1: //promotion
            controller.stopAudio();
            naController.current_index = 2.obs;
            Get.toNamed('/mainscreen');
            break;
          case 2: //home
            controller.stopAudio();
            naController.current_index = 0.obs;
            Get.toNamed('/mainscreen');
            break;
          case 3: //service
            controller.stopAudio();
            naController.current_index = 1.obs;
            Get.toNamed('/mainscreen');
            break;
          case 4: //event
            controller.stopAudio();
            naController.current_index = 2.obs;
            Get.toNamed('/mainscreen');
            break;
          default:
            controller.stopAudio();
            naController.current_index = 0.obs;
            Get.toNamed('/mainscreen');
            break;
        }
      },
      child: SizedBox(
        width: 125.w,
        height: 100.h,
        child: Stack(
          children: [
            Positioned(
              bottom: 0.h,
              left: 0.w,
              right: 0.w,
              child: Container(
                height: 50.h,
                decoration: const BoxDecoration(
                  color: AppColors.transparent,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    name[widget.index],
                    textAlign: TextAlign.center,
                    style: AppStyles.h4.copyWith(
                        fontWeight: isFocus[widget.index]
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: isFocus[widget.index]
                            ? AppColors.title
                            : AppColors.greyColor,
                        fontSize: (size.width * 0.02).sp),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeIn,
                width: isFocus[widget.index] ? 120.w : 90.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: isFocus[widget.index]
                          ? AppColors.orangeColor
                          : AppColors.white,
                      width: 2.w),
                  image: DecorationImage(
                    image: NetworkImage(image[widget.index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
