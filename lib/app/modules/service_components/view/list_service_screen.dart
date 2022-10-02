// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:smarttv_app/app/modules/service_components/controller/list_service_controller.dart';
import 'package:smarttv_app/app/values/app_colors.dart';
import 'package:smarttv_app/app/values/app_styles.dart';
import 'package:smarttv_app/app/modules/service_components/widget/card_each_service.dart';

class ListSerivceScreen extends GetView<ListServiceController> {
  String cateId;
  ListSerivceScreen({
    super.key,
    required this.cateId,
  });

  @override
  Widget build(BuildContext context) {
    Size size = Size(960, 540);
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
              child: Container(
            color: AppColors.background,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 30, left: 15),
                  child: Text(
                    "Thức ăn",
                    style: AppStyles.h4.copyWith(
                        color: AppColors.header,
                        fontSize: size.width * 25 / 1000),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: GridView.builder(
                      itemCount: 10,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 60,
                        mainAxisSpacing: 36,
                        mainAxisExtent: 210,
                      ),
                      itemBuilder: (context, index) => CardEachService(
                            index: index,
                          )),
                )),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
