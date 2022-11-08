import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class TaxiController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  Rx<List<ServiceContent>> taxiContent = Rx<List<ServiceContent>>([]);
  bool checkbox = false;

  @override
  void onInit() {
    fetchServiceTaxi(4);
    super.onInit();
  }

  Future<void> fetchServiceTaxi(int serivceCategoryId) async {
    var overview = _repository.getListServiceContentByCateId(serivceCategoryId);
    List<ServiceContent> result = [];

    await callDataService(
      overview,
      onSuccess: (List<ServiceContent> response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    taxiContent(result);
  }
}
