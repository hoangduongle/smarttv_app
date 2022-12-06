// ignore_for_file: unused_local_variable
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/controller/image_controller.dart';
import 'package:smarttv_app/app/core/model/abtraction_content.dart';
import 'package:smarttv_app/app/core/model/image_content.dart';
import 'package:smarttv_app/app/core/utils/date_time_utils.dart';
import 'package:smarttv_app/app/core/values/app_assets.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class AbtractionController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());

  Rx<List<AbstractionsContent>> abtractions = Rx<List<AbstractionsContent>>([]);
  int indexMarker = 0;

  @override
  Future<void> onInit() async {
    fetchAbtractions();
    super.onInit();
  }

  Future<void> reload() async {
    onInit();
  }

  Future<void> fetchAbtractions() async {
    var overview = _repository.getListAbtraction();
    List<AbstractionsContent> result = [];

    await callDataService(
      overview,
      onSuccess: (List<AbstractionsContent> response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    abtractions(result);
    addImage();
    addLatLongHotel();
    debugPrint("Abtraction ${DateTimeUtils.currentDateTimeSecond()}");
  }

  void addLatLongHotel() {
    abtractions.value.add(AbstractionsContent(
      id: 0,
      address: "Vinhome Grand Park Q9",
      openTime: "00:00",
      closeTime: "23:59",
      description: "",
      image: ImageContent(
          pictureUrl:
              "https://www.gannett-cdn.com/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg"),
      latidute: 10.838606359520535,
      longtitude: 106.83161588307689,
      name: "5 Men Hotel",
    ));
  }

  void addImage() {
    ImageController imageController = Get.find();
    if (imageController.imageContent.value.isEmpty) {
      Future.delayed(
        const Duration(seconds: 2),
        () {
          return addImage();
        },
      );
    } else {
      for (int i = 0; i < abtractions.value.length; i++) {
        abtractions.value[i].image = imageController
            .getImageById("abstraction_${abtractions.value[i].id}");
      }
    }
    update();
  }
}
