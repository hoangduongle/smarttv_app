// ignore_for_file: must_call_super, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/service_category_content.dart';
import 'package:smarttv_app/app/data/data.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';
import 'package:smarttv_app/app/values/app_colors.dart';

class ServiceController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  // Rx<List<ServiceCategoryContent>> serviceCateList =
  //     Rx<List<ServiceCategoryContent>>([]);
  List<ServiceCategoryContent> serviceCateList = [
    ServiceCategoryContent(
        id: "C001",
        name: "Thức Ăn",
        picture:
            "https://images.unsplash.com/photo-1551573355-19727699d60a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
        description: "aaaaa"),
    ServiceCategoryContent(
        id: "C002",
        name: "Thức Uống",
        picture:
            "https://images.unsplash.com/photo-1551509134-2f9d4ec80a9b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
        description: "aaaaa"),
    ServiceCategoryContent(
        id: "C003",
        name: "Giặt Ủi",
        picture:
            "https://images.unsplash.com/photo-1553152531-b98a2fc8d3bf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80",
        description: "aaaaa"),
    ServiceCategoryContent(
        id: "C004",
        name: "Thuê Xe",
        picture:
            "https://images.unsplash.com/photo-1552752399-22aa8f97ade0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
        description: "aaaaa"),
    ServiceCategoryContent(
        id: "C005",
        name: "Turn Down",
        picture:
            "https://images.unsplash.com/photo-1552752399-22aa8f97ade0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
        description: "aaaaa"),
    ServiceCategoryContent(
        id: "C006",
        name: "Tra phong",
        picture:
            "https://images.unsplash.com/photo-1552752399-22aa8f97ade0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
        description: "aaaaa"),
  ];
  void serviceComponent(ServiceCategoryContent serviceCategory) async {
    if (serviceCategory.id == 'C005') {
      //check out
      Get.dialog(
        AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          backgroundColor: AppColors.navigabackground,
          title: const Text(
            'Thông báo',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.focus),
          ),
          content: SizedBox(
            width: 50.w,
            child: const Text(
              'Bạn có muốn thực hiện yêu cầu trả phòng không?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.white,
              ),
            ),
          ),
          actions: [
            SizedBox(
              width: 60.w,
              height: 20.h,
              child: Material(
                color: AppColors.focus,
                borderRadius: BorderRadius.circular(5.r),
                child: InkWell(
                    autofocus: true,
                    focusColor: AppColors.orangeColor,
                    borderRadius: BorderRadius.circular(5.r),
                    onTap: () {
                      Get.back();
                      debugPrint(
                          "Customer room ${device.roomId} want to check out");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Có',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              // fontSize: 20,
                              color: AppColors.black),
                        ),
                      ],
                    )),
              ),
            ),
            SizedBox(
              width: 60,
              height: 20,
              child: Material(
                color: AppColors.focus,
                borderRadius: BorderRadius.circular(5),
                child: InkWell(
                    focusColor: AppColors.orangeColor,
                    borderRadius: BorderRadius.circular(5),
                    onTap: () {
                      Get.back();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Không',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.black),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      );

      debugPrint(serviceCategory.id);
    } else if (serviceCategory.id == 'C003') {
      Get.dialog(
        AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          backgroundColor: AppColors.navigabackground,
          title: const Text(
            'Thông báo',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.focus),
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 250.w,
                child: const Text(
                  'Quý khách vui lòng chọn thời gian dọn phòng.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 16.h)),
              SizedBox(
                width: 120.w,
                height: 30.h,
                child: Material(
                  color: AppColors.focus,
                  borderRadius: BorderRadius.circular(5.r),
                  child: InkWell(
                      autofocus: true,
                      focusColor: AppColors.orangeColor,
                      borderRadius: BorderRadius.circular(5.r),
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Chọn thời gian',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // fontSize: 20,
                                color: AppColors.black),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
          actions: [
            SizedBox(
              width: 60.w,
              height: 20.h,
              child: Material(
                color: AppColors.focus,
                borderRadius: BorderRadius.circular(5.r),
                child: InkWell(
                    focusColor: AppColors.orangeColor,
                    borderRadius: BorderRadius.circular(5.r),
                    onTap: () {
                      Get.back();
                      debugPrint("Room ${device.roomId} want to set Alarm at");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Gửi',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              // fontSize: 20,
                              color: AppColors.black),
                        ),
                      ],
                    )),
              ),
            ),
            SizedBox(
              width: 60.w,
              height: 20.h,
              child: Material(
                color: AppColors.focus,
                borderRadius: BorderRadius.circular(5.r),
                child: InkWell(
                    focusColor: AppColors.orangeColor,
                    borderRadius: BorderRadius.circular(5.r),
                    onTap: () {
                      Get.back();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Huỷ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              // fontSize: 20,
                              color: AppColors.black),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      );
      debugPrint(serviceCategory.id);
    } else {
      Get.toNamed('/service-component/${serviceCategory.id}');
    }
    // Get.toNamed('/service-component/${serviceCategory.id}');
  }

  @override
  void onInit() {
    // fetchServiceCategory();
    super.onInit();
  }

  // Future<void> fetchServiceCategory() async {
  //   var servicecate = _repository.getListServiceCate();
  //   List<ServiceCategoryContent> result = [];

  //   await callDataService(
  //     servicecate,
  //     onSuccess: (List<ServiceCategoryContent> response) {
  //       result = response;
  //     },
  //     onError: ((dioError) {}),
  //   );
  //   serviceCateList(result);
  // }
}
