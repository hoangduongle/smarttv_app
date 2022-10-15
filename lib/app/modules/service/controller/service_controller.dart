// ignore_for_file: must_call_super, avoid_print, unused_field

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/service_category_content.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class ServiceController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  Rx<List<ServiceCategoryContent>> serviceCateList =
      Rx<List<ServiceCategoryContent>>([]);
  Rx<List<ServiceCategoryContent>> serviceCateListTMP =
      Rx<List<ServiceCategoryContent>>([]);
  @override
  void onInit() {
    // fetchServiceCategory();
    super.onInit();
  }

  Future<void> fetchServiceCategory() async {
    var servicecate = _repository.getListServiceCate();
    List<ServiceCategoryContent> result = [];
    await callDataService(
      servicecate,
      onSuccess: (List<ServiceCategoryContent> response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    serviceCateListTMP(result);
    fandB();
  }

  void fandB() {
    serviceCateList.value.add(ServiceCategoryContent(
        id: 1, description: "thuc don", name: "Thực đơn"));
    for (var element in serviceCateListTMP.value) {
      if (element.id != 1 && element.id != 2) {
        serviceCateList.value.add(element);
      }
    }
    debugPrint(serviceCateList.value.toString());
    // debugPrint(serviceCateList.value[0].toString());
  }
}
