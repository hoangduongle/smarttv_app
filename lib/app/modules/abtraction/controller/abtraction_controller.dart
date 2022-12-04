// ignore_for_file: unused_local_variable
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/abtraction_content.dart';
import 'package:smarttv_app/app/core/utils/date_time_utils.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class AbtractionController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());

  Rx<List<AbtractionContent>> abtractions = Rx<List<AbtractionContent>>([]);
  int indexMarker = 0;
  bool isLoading = true;
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
    List<AbtractionContent> result = [];

    await callDataService(
      overview,
      onStart: () {
        isLoading = true;
      },
      onComplete: () {
        isLoading = false;
      },
      onSuccess: (List<AbtractionContent> response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    abtractions(result);
    debugPrint("Abtraction ${DateTimeUtils.currentDateTimeSecond()}");
  }
}
