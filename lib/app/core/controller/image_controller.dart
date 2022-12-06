import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/image_content.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class ImageController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  Rx<List<ImageContent>> imageContent = Rx<List<ImageContent>>([]);

  @override
  void onInit() {
    fetchImages();
    super.onInit();
  }

  ImageContent getImageById(String id) {
    return imageContent.value.firstWhere(
      (element) => element.pictureType == "img_$id",
      orElse: () => ImageContent(),
    );
  }

  Future<void> fetchImages() async {
    var services = _repository.getListImage();
    List<ImageContent> result = [];
    await callDataService(
      services,
      onSuccess: (List<ImageContent> response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    imageContent(result);
    // debugPrint("${imageContent.toString()}");
  }
}
