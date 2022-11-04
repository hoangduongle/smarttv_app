import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/image_content.dart';
import 'package:smarttv_app/app/core/model/mayjor_content.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/data/dio/dio_token_manager.dart';
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
  Rx<List<ServiceContent>> serviceNuoctra = Rx<List<ServiceContent>>([]);
  Rx<List<ServiceContent>> serviceNuocsuoi = Rx<List<ServiceContent>>([]);
  Rx<List<ServiceContent>> serviceBia = Rx<List<ServiceContent>>([]);
  Rx<List<ServiceContent>> serviceNuocmocktails = Rx<List<ServiceContent>>([]);
//=============================================================================
  Rx<List<ImageContent>> imageFandB = Rx<List<ImageContent>>([]);
  List<MayjorContent> mayjorFood = [];
  List<MayjorContent> mayjorDrink = [];

  var numberSelected = 0.obs;

  @override
  void onInit() async {
    _loadData();
    await fetchImage("img_fandb");
    await fetchServicesFood();
    await fetchServicesDrink();
    createMajor();
    super.onInit();
  }

  void _loadData() {
    if (!TokenManager.instance.hasToken) {
      TokenManager.instance.init();
    }
  }

  Future<void> fetchImage(String type) async {
    var overview = _repository.getListImageByType(type);
    List<ImageContent> result = [];
    await callDataService(
      overview,
      onSuccess: (List<ImageContent> response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    imageFandB(result);
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

  void createMajor() {
    mayjorFood = [
      MayjorContent(
          id: 0, name: "Món khai vị", image: imageFandB.value[0].pictureUrl!),
      MayjorContent(
          id: 1, name: "Món chính", image: imageFandB.value[1].pictureUrl!),
      MayjorContent(
          id: 2,
          name: "Món tráng miệng",
          image: imageFandB.value[2].pictureUrl!),
    ];
    mayjorDrink = [
      MayjorContent(
          id: 3, name: "Cà phê", image: imageFandB.value[3].pictureUrl!),
      MayjorContent(
          id: 4, name: "Nước trà", image: imageFandB.value[4].pictureUrl!),
      MayjorContent(
          id: 5,
          name: "Nước suối và nước ngọt",
          image: imageFandB.value[5].pictureUrl!),
      MayjorContent(
          id: 6,
          name: "Nước mocktails",
          image: imageFandB.value[6].pictureUrl!),
      MayjorContent(id: 7, name: "Bia", image: imageFandB.value[7].pictureUrl!),
    ];
    filter();
  }

  void filter() {
    String food = "";
    for (var element in serviceListFood.value) {
      food = element.majorGroup.toString();
      switch (food) {
        case "khai_vi":
          serviceKhaivi.value.add(element);
          break;
        case "Mon_chinh":
          serviceMonchinh.value.add(element);
          break;
        case "Trang_mieng":
          serviceTrangmieng.value.add(element);
          break;
      }
    }
    String drink = "";
    for (var element in serviceListDrink.value) {
      drink = element.majorGroup.toString();
      switch (drink) {
        case "Nuoc_cafe":
          serviceNuoctra.value.add(element);
          break;
        case "Nuoc_tra":
          serviceNuoctra.value.add(element);
          break;
        case "Nuoc_suoi":
          serviceNuocsuoi.value.add(element);
          break;
        case "Nuoc_mocktails":
          serviceNuocmocktails.value.add(element);
          break;
        case "Bia":
          serviceBia.value.add(element);
          break;
      }
    }
  }
}
