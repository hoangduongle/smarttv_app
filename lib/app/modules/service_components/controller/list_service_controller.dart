// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/core/dio/dio_token_manager.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class ListServiceController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  Rx<List<ServiceContent>> serviceList = Rx<List<ServiceContent>>([]);

  var serviceCateId;

  @override
  void onInit() async {
    final prefs = await SharedPreferences.getInstance();
    serviceCateId = prefs.getInt("cateId");
    // debugPrint(serviceCateId.toString());
    super.onInit();
  }

  @override
  void onReady() {
    _loadDate();
    fetchServices();
    super.onReady();
  }

  void _loadDate() {
    if (!TokenManager.instance.hasToken) {
      TokenManager.instance.init();
    }
  }

  Future<void> fetchServices() async {
    var services = _repository.getListServiceContentByCateId(serviceCateId);
    List<ServiceContent> result = [];
    await callDataService(
      services,
      onSuccess: (List<ServiceContent> response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    serviceList(result);
  }
}
