// ignore_for_file: must_call_super, avoid_print, unused_field
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/image_content.dart';
import 'package:smarttv_app/app/core/model/service_category_content.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class ServiceController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  Rx<List<ImageContent>> imageServiceCategoriesTMP = Rx<List<ImageContent>>([]);
  Rx<List<ImageContent>> imageServiceCategories = Rx<List<ImageContent>>([]);
  bool canRequestFocus = false;

  Rx<List<ServiceCategoryContent>> serviceCateList =
      Rx<List<ServiceCategoryContent>>([]);
  Rx<List<ServiceCategoryContent>> serviceCateListTMP =
      Rx<List<ServiceCategoryContent>>([]);

  @override
  void onInit() {
    // fetchImage("img_serviceCategory");
    fetchServiceCategory();
    super.onInit();
  }

  void reload() {
    onInit();
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
    imageServiceCategories(result);
  }

  Future<void> fetchServiceCategory() async {
    var servicecate = _repository.getListServiceCate();
    List<ServiceCategoryContent> result = [];
    await callDataService(
      servicecate,
      onSuccess: (List<ServiceCategoryContent> response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    serviceCateListTMP(result);
    // debugPrint(serviceCateListTMP.value.length.toString());
    fandB();
  }

  void fandB() {
    serviceCateList.value.add(ServiceCategoryContent(
        id: 1, description: "fandb", name: "Thức ăn và đồ uống"));
    for (var element in serviceCateListTMP.value) {
      if (element.id != 1 && element.id != 2) {
        if (element.status == true) {
          serviceCateList.value.add(element);
        }
      }
    }
  }
}
