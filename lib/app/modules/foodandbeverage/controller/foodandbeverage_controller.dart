import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/data/dio/dio_token_manager.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class FoodandBeverageController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  Rx<List<ServiceContent>> serviceListFood = Rx<List<ServiceContent>>([]);
  Rx<List<ServiceContent>> serviceListDrink = Rx<List<ServiceContent>>([]);

  var numberSelected = 0.obs;

  @override
  void onInit() async {
    _loadData();
    await fetchServicesFood();
    await fetchServicesDrink();
    debugPrint(serviceListDrink.value.toString());
    super.onInit();
  }

  void _loadData() {
    if (!TokenManager.instance.hasToken) {
      TokenManager.instance.init();
    }
  }

  Future<void> fetchServicesFood() async {
    var services = _repository.getListServiceContentByCateId(1);
    List<ServiceContent> result = [];
    await callDataService(
      services,
      onSuccess: (List<ServiceContent> response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    serviceListFood(result);
  }

  Future<void> fetchServicesDrink() async {
    var services = _repository.getListServiceContentByCateId(2);
    List<ServiceContent> result = [];
    await callDataService(
      services,
      onSuccess: (List<ServiceContent> response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    serviceListDrink(result);
  }
}
