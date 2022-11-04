import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/image_content.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class CheckoutController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  Rx<List<ImageContent>> imageCheckout = Rx<List<ImageContent>>([]);

  @override
  void onInit() {
    fetchImage("img_checkout");
    super.onInit();
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
    imageCheckout(result);
  }
}
