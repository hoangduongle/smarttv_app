// ignore_for_file: unrelated_type_equality_checks

import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/image_content.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class TurndownController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  Rx<List<ImageContent>> imageTurndown = Rx<List<ImageContent>>([]);

  @override
  void onInit() {
    fetchImage("img_turndown");
    super.onInit();
  }

  var countHours = 8.obs;
  var countMinute = 0.obs;

  void incrementHours() {
    countHours++;
  }

  void decrementHours() {
    countHours--;
  }

  void incrementMinute() {
    countMinute++;
  }

  void decrementMinute() {
    countMinute--;
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
    imageTurndown(result);
  }
}
