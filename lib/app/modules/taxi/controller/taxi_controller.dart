import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';
import 'package:smarttv_app/app/modules/taxi/widget/taxi_dialog.dart';
import 'package:smarttv_app/app/widget/loading_dialog.dart';

class TaxiController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  Rx<List<ServiceContent>> taxiContent = Rx<List<ServiceContent>>([]);
  bool checkbox = false;

  @override
  void onInit() {
    fetchServiceTaxi(4);
    super.onInit();
  }

  Future<void> orderService(ServiceContent service) async {
    Get.back();
    const LoadingDialog().showLoadingDialog(Get.context!);
    await Future.delayed(const Duration(seconds: 2), () => Get.back());
    const TaxiDialog().showSuccessDialog(Get.context!);
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
