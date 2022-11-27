// ignore_for_file: must_call_super, avoid_print, unused_field
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/service_category_content.dart';
import 'package:smarttv_app/app/core/utils/date_time_utils.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class ServiceController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  bool canRequestFocus = false;

  Rx<List<ServiceCategoryContent>> serviceCateList =
      Rx<List<ServiceCategoryContent>>([]);
  Rx<List<ServiceCategoryContent>> serviceCateListTMP =
      Rx<List<ServiceCategoryContent>>([]);

  @override
  Future<void> onInit() async {
    fetchServiceCategory();
    super.onInit();
  }

  Future<void> reload() async {
    onInit();
  }

  Future<List<ServiceCategoryContent>> fetchServiceCategory() async {
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
    debugPrint("Service Category ${DateTimeUtils.currentDateTimeSecond()}");
    fandB();
    return result;
  }

  void fandB() {
    if (serviceCateList.value.isNotEmpty) {
      serviceCateList.value.clear();
    }
    for (var element in serviceCateListTMP.value) {
      if (element.id == 1) {
        serviceCateList.value.add(ServiceCategoryContent(
            id: 1,
            description: "fandb",
            name: "Thức ăn và đồ uống",
            images: element.images));
      } else if (element.id != 1 && element.id != 2 && element.id != 12) {
        if (element.status == true) {
          serviceCateList.value.add(element);
        }
      }
    }
  }
}
