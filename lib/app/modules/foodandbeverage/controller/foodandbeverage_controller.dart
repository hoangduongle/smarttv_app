// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/image_content.dart';
import 'package:smarttv_app/app/core/model/mayjor_content.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/core/dio/dio_token_manager.dart';
import 'package:smarttv_app/app/core/utils/date_time_utils.dart';
import 'package:smarttv_app/app/data/data.dart';
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
  Rx<List<ImageContent>> imageFandB = Rx<List<ImageContent>>([]);
  List<MayjorContent> mayjorFood = [];
  List<MayjorContent> mayjorDrink = [];

  var numberSelected = 0.obs;

  @override
  void onInit() async {
    _loadData();
    createMajor();
    var futures = await Future.wait([
      fetchServicesFood(),
      fetchServicesDrink(),
    ]);
    // filter();
    super.onInit();
  }

  // Stream<List<ServiceContent>> serviceFBStream() async* {
  //   while (true) {
  //     await Future.delayed(const Duration(seconds: SECONDS));
  //     List<ServiceContent> foodServices = await fetchServicesFood();
  //     List<ServiceContent> drinkServices = await fetchServicesDrink();
  //       createMajor();
  //     yield drinkServices;
  //   }
  // }

  void _loadData() {
    if (!TokenManager.instance.hasToken) {
      TokenManager.instance.init();
    }
  }

  Future<List<ServiceContent>> fetchServicesFood() async {
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
    debugPrint("Food ${DateTimeUtils.currentDateTimeSecond()}");
    return result;
  }

  Future<List<ServiceContent>> fetchServicesDrink() async {
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
    debugPrint("Drink ${DateTimeUtils.currentDateTimeSecond()}");
    return result;
  }

  void createMajor() {
    mayjorFood = [
      MayjorContent(
          id: 0,
          name: "Món khai vị",
          image: "https://i.ibb.co/1XrSCCn/khaivi.jpg"),
      //imageFandB.value[0].pictureUrl!
      MayjorContent(
          id: 1,
          name: "Món chính",
          image: "https://i.ibb.co/FXxCjRs/monchinh.jpg"),
      MayjorContent(
          id: 2,
          name: "Món tráng miệng",
          image: "https://i.ibb.co/VCdGJd5/trangmieng.jpg"),
    ];
    mayjorDrink = [
      MayjorContent(
          id: 3, name: "Cà phê", image: "https://i.ibb.co/rkKPj6d/coffee.jpg"),
      MayjorContent(
          id: 4, name: "Nước trà", image: "https://i.ibb.co/S57jQwN/tea.jpg"),
      MayjorContent(
          id: 5,
          name: "Nước suối và nước ngọt",
          image: "https://i.ibb.co/hy50Vj5/nuocngot.jpg"),
      MayjorContent(
          id: 6,
          name: "Nước mocktails",
          image: "https://i.ibb.co/3BkkL5L/mocktails.jpg"),
      MayjorContent(
          id: 7, name: "Bia", image: "https://i.ibb.co/2k5QHCB/bia.png"),
    ];
  }

  void filter() {
    String food = "";

    if (serviceKhaivi.value.isNotEmpty) {
      serviceKhaivi.value.clear();
    }
    if (serviceMonchinh.value.isNotEmpty) {
      serviceMonchinh.value.clear();
    }
    if (serviceTrangmieng.value.isNotEmpty) {
      serviceTrangmieng.value.clear();
    }

    for (var element in serviceListFood.value) {
      if (element.status == true) {
        food = element.majorGroup.toString();
        switch (food) {
          case "appetizer": //appetizer
            serviceKhaivi.value.add(element);
            break;
          case "main_dishes": //main_dishes
            serviceMonchinh.value.add(element);
            break;
          case "dessert": //dessert
            serviceTrangmieng.value.add(element);
            break;
        }
      }
    }
    String drink = "";
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
      serviceNuocsuoi.value.clear();
    }
    if (serviceBia.value.isNotEmpty) {
      serviceNuocsuoi.value.clear();
    }

    for (var element in serviceListDrink.value) {
      if (element.status == true) {
        drink = element.majorGroup.toString();
        switch (drink) {
          case "coffee": //coffee
            serviceCafe.value.add(element);
            // debugPrint(element.toString());
            break;
          case "tea": //tea
            serviceNuoctra.value.add(element);
            break;
          case "water_and_soft_drink": //water_and_soft_drink
            serviceNuocsuoi.value.add(element);
            break;
          case "mocktails": //mocktails
            serviceNuocmocktails.value.add(element);
            break;
          case "beer": //beer
            serviceBia.value.add(element);
            break;
        }
      }
    }
    update();
  }
}
