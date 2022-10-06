// ignore_for_file: unnecessary_null_comparison

import 'package:get/get.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/core/values/app_colors.dart';

class CartController extends GetxController {
  int? serviceId = 0;
  ServiceContent? serContent;



  final _service = {}.obs;
  
  void addService(ServiceContent serviceContent) {
    if (_service.containsKey(serviceContent)) {
      _service[serviceContent] += 1;
    } else {
      _service[serviceContent] = 1;
    }
    Get.snackbar("${serviceContent.name} đã thêm vào giỏ", "số lượng:",
        colorText: AppColors.white,
        duration: const Duration(milliseconds: 1000));
  }
}
