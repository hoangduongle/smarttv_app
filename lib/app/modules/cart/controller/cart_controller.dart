// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';

class CartController extends GetxController {
  int? serviceId = 0;
  ServiceContent? serContent;

  final _service = {}.obs;

  void addService(ServiceContent serviceContent, int quantity) {
    if (_service.containsKey(serviceContent)) {
      _service[serviceContent] += quantity;
    } else {
      _service[serviceContent] = quantity;
    }
    Get.snackbar(
        "${serviceContent.name} đã thêm vào giỏ", "số lượng: $quantity",
        colorText: AppColors.black,
        backgroundColor: AppColors.focus.withOpacity(.6),
        duration: const Duration(milliseconds: 1500));
  }

  void removeSerivce(ServiceContent serviceContent) {
    if (_service.containsKey(serviceContent) && _service[serviceContent] == 1) {
      _service.removeWhere((key, value) => key == serviceContent);
    } else {
      _service[serContent] -= 1;
    }
  }

  get services => _service;
  get serviceSubtotal => _service.entries
      .map((service) => service.key.price * service.value)
      .toList();

  get total {
    String x;
    try {
      x = _service.entries
          .map((service) => service.key.price * service.value)
          .toList()
          .reduce((value, element) => value + element)
          .toString();
    } catch (e) {
      x = 0.toString();
    }
    return x;
  }

  get sizeService => _service.keys.length;
}
