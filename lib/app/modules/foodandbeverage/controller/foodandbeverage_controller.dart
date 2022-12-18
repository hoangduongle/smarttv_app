// ignore_for_file: unused_local_variable, unrelated_type_equality_checks

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/controller/image_controller.dart';
import 'package:smarttv_app/app/core/model/mayjor_content.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/core/dio/dio_token_manager.dart';
import 'package:smarttv_app/app/core/values/app_const.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class FoodandBeverageController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
//=============================================================================
  Rx<List<ServiceContent>> serviceListFood = Rx<List<ServiceContent>>([]);
  Rx<List<ServiceContent>> serviceListDrink = Rx<List<ServiceContent>>([]);
//=============================================================================
  Rx<List<ServiceContent>> serviceKhaivi = Rx<List<ServiceContent>>([]);
  Rx<List<ServiceContent>> serviceMonchinh = Rx<List<ServiceContent>>([]);
  Rx<List<ServiceContent>> serviceTrangmieng = Rx<List<ServiceContent>>([]);
//=============================================================================
  Rx<List<ServiceContent>> serviceCafe = Rx<List<ServiceContent>>([]);
  Rx<List<ServiceContent>> serviceNuoctra = Rx<List<ServiceContent>>([]);
  Rx<List<ServiceContent>> serviceNuocsuoi = Rx<List<ServiceContent>>([]);
  Rx<List<ServiceContent>> serviceNuocmocktails = Rx<List<ServiceContent>>([]);
  Rx<List<ServiceContent>> serviceBia = Rx<List<ServiceContent>>([]);
//=============================================================================
  List<MayjorContent> mayjorFood = [];
  List<MayjorContent> mayjorDrink = [];

  Rx<List<String>> serviceTop = Rx<List<String>>([]);

  var numberSelected = 0.obs;
  @override
  bool isLoading = true;

  @override
  void onInit() async {
    fetchServicesTop();
    _loadData();
    createMajor();
    await Future.wait([
      fetchServicesFood(),
      fetchServicesDrink(),
    ]);
    filter();
    super.onInit();
  }

  void _loadData() {
    if (!TokenManager.instance.hasToken) {
      TokenManager.instance.init();
    }
  }

  Future<void> fetchServicesTop() async {
    var services = _repository.serviceTop();
    List<String> result = [];
    await callDataService(
      services,
      onSuccess: (List<String> response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    serviceTop(result);
  }

  bool getTopBestSale(int id) {
    bool result = false;
    for (var top in serviceTop.value) {
      if (top == "$id") {
        result = true;
      }
    }
    return result;
  }

  Future<void> fetchServicesFood() async {
    var services = _repository.getListServiceContentByCateId(1);
    List<ServiceContent> result = [];
    await callDataService(
      services,
      onStart: () {
        isLoading = true;
      },
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
      onStart: () {
        isLoading = true;
      },
      onSuccess: (List<ServiceContent> response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    serviceListDrink(result);
  }

  void createMajor() {
    mayjorFood = [
      MayjorContent(
          id: 0, name: "Món khai vị", image: AppConstants.mayjorAppetizer),
      MayjorContent(
          id: 1, name: "Món chính", image: AppConstants.mayjorMain_Dishes),
      MayjorContent(
          id: 2, name: "Món tráng miệng", image: AppConstants.mayjorDessert),
    ];
    mayjorDrink = [
      MayjorContent(id: 3, name: "Cà phê", image: AppConstants.mayjorCoffee),
      MayjorContent(id: 4, name: "Nước trà", image: AppConstants.mayjorTea),
      MayjorContent(
          id: 5,
          name: "Nước suối và nước ngọt",
          image: AppConstants.mayjorWater_And_Soft_Drink),
      MayjorContent(
          id: 6, name: "Nước mocktails", image: AppConstants.mayjorMocktails),
      MayjorContent(id: 7, name: "Bia", image: AppConstants.mayjorBeer),
    ];
  }

  void filter() {
    ImageController imageController = Get.find();

    if (serviceKhaivi.value.isNotEmpty) {
      serviceKhaivi.value.clear();
    }
    if (serviceMonchinh.value.isNotEmpty) {
      serviceMonchinh.value.clear();
    }
    if (serviceTrangmieng.value.isNotEmpty) {
      serviceTrangmieng.value.clear();
    }
    String food = "";
    for (var element in serviceListFood.value) {
      if (element.status == true) {
        food = element.majorGroup.toString();
        element.image = (imageController.getImageById("service_${element.id}"));
        element.isBestsale = getTopBestSale(element.id!);
        switch (food) {
          case "appetizer":
            serviceKhaivi.value.add(element);
            break;
          case "main_dishes":
            serviceMonchinh.value.add(element);
            break;
          case "dessert":
            serviceTrangmieng.value.add(element);
            break;
        }
      }
    }
    if (serviceCafe.value.isNotEmpty) {
      serviceCafe.value.clear();
    }
    if (serviceNuoctra.value.isNotEmpty) {
      serviceNuoctra.value.clear();
    }
    if (serviceNuocsuoi.value.isNotEmpty) {
      serviceNuocsuoi.value.clear();
    }
    if (serviceNuocmocktails.value.isNotEmpty) {
      serviceNuocmocktails.value.clear();
    }
    if (serviceBia.value.isNotEmpty) {
      serviceBia.value.clear();
    }
    String drink = "";
    for (var element in serviceListDrink.value) {
      if (element.status == true) {
        drink = element.majorGroup.toString();
        element.image = (imageController.getImageById("service_${element.id}"));
        element.isBestsale = getTopBestSale(element.id!);
        switch (drink) {
          case "coffee":
            serviceCafe.value.add(element);
            break;
          case "tea":
            serviceNuoctra.value.add(element);
            break;
          case "water_and_soft_drink":
            serviceNuocsuoi.value.add(element);
            break;
          case "mocktails":
            serviceNuocmocktails.value.add(element);
            break;
          case "beer":
            serviceBia.value.add(element);
            break;
        }
      }
    }
    isLoading = false;
  }
}
