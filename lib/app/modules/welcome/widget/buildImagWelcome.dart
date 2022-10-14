// ignore_for_file: prefer_interpolation_to_compose_strings, unnecessary_brace_in_string_interps, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';
import 'package:smarttv_app/app/modules/main/navigation/navigator_controller.dart';
import 'package:smarttv_app/app/modules/welcome/controller/wellcome_controller.dart';

Widget buildImageWelcome(Size size, int index, BuildContext context) {
  NavigatorController naController =
      Get.find(tag: (NavigatorController).toString());
  WellcomeController controller = Get.find();
  return Material(
    color: AppColors.transparent,
    child: InkWell(
      onTap: () {
        debugPrint(index.toString());
        naController.current_index = index.obs;
        Get.offNamed('/mainscreen');
      },
      borderRadius: BorderRadius.circular(99),
      focusColor: AppColors.greyColor.withOpacity(0.2),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.white, width: 2),
          image: DecorationImage(
            image: NetworkImage(controller.image[index]),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}
//https://images.unsplash.com/photo-1551573355-19727699d60a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80
//controller.image[index]