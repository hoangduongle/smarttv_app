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
  @override
  void onInit() {
    fetchAbtractions();
    super.onInit();
  }

  Future<void> fetchAbtractions() async {
    var overview = _repository.getListAbtraction();
    List<AbtractionContent> result = [];

    await callDataService(
      overview,
      onSuccess: (List<AbtractionContent> response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    abtractions(result);
    debugPrint("Abtraction ${DateTimeUtils.currentDate()}");
  }
}
