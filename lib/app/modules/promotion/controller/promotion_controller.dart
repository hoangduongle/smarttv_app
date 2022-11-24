import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/news_content.dart';
import 'package:smarttv_app/app/core/utils/date_time_utils.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class PromotionController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  Rx<List<NewsContent>> promotionList = Rx<List<NewsContent>>([]);

  @override
  Future<void> onInit() async {
    await fetchNewsPromotion();
    super.onInit();
  }

  Future<void> reload() async {
    onInit();
  }

  Future<void> fetchNewsPromotion() async {
    promotionList.value.clear();
    var overview = _repository.getListNewsByType("promotion");
    List<NewsContent> result = [];

    await callDataService(
      overview,
      onSuccess: (List<NewsContent> response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    promotionList(result);
    debugPrint("Promotion ${DateTimeUtils.currentDateTimeSecond()}");
  }
}
