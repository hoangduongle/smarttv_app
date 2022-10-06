import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/service_content.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class ListServiceController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  Rx<List<ServiceContent>> serviceList = Rx<List<ServiceContent>>([]);

  int? serviceCateId;

  @override
  void onInit() {
    fetchServices();
    super.onInit();
  }

  Future<void> fetchServices() async {
    var services = _repository.getListServiceContentByCateId();
    List<ServiceContent> result = [];
    await callDataService(
      services,
      onSuccess: (List<ServiceContent> response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    serviceList(result);
  }
}
