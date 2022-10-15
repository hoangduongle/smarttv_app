import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/promotion_content.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class PromotionController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  Rx<List<PromotionContent>> promotionList = Rx<List<PromotionContent>>([]);

  @override
  void onInit() {
    fetchPromotion();
    super.onInit();
  }

  Future<void> fetchPromotion() async {
    var overview = _repository.getListPromotion();
    List<PromotionContent> result = [];

    await callDataService(
      overview,
      onSuccess: (List<PromotionContent> response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    promotionList(result);
  }
}
