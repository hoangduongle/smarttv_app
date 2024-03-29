// ignore_for_file: non_constant_identifier_names, must_call_super, unused_field

import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';

import 'package:smarttv_app/app/core/model/overview_content.dart';
import 'package:smarttv_app/app/core/model/service_category_content.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';
import 'package:smarttv_app/app/modules/service/controller/service_controller.dart';

class HomeController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  Rx<List<OverviewContent>> overviewList = Rx<List<OverviewContent>>([]);
  var currentInt = 0.obs;

  @override
  void onInit() {
    getall();
    super.onInit();
  }

  Future<void> reload() async {
    onInit();
  }

  void getall() {
    ServiceController serviceController = Get.find();
    if (serviceController.serviceCateList.value.isEmpty) {
      Future.delayed(const Duration(seconds: 2), () {
        return getall();
      });
    } else {
      Future.delayed(
        const Duration(seconds: 2),
        () {
          if (overviewList.value.isNotEmpty) {
            overviewList.value.clear();
          }
          List<ServiceCategoryContent> serviceCateList =
              serviceController.serviceCateList.value;
          for (int i = 0; i < serviceCateList.length; i++) {
            overviewList.value.add(OverviewContent(
                id: i,
                imageUrl: serviceCateList[i].image?.pictureUrl,
                description: "${serviceCateList[i].description}.",
                title: serviceCateList[i].name));
          }
        },
      );
    }

    update();
  }
}





















    // HomeProvider().getPostsList(
    //   beforeSend: () {},
    //   onSuccess: (Overview) {
    //     overviewList.addAll(Overview);
    //     isLoading = false;
    //     debugPrint("HomePage Api: Success");
    //     update();
    //   },
    //   onError: (error) {
    //     // isLoading = false;
    //     update();
    //     debugPrint("HomePage Api: Error");
    //   },
    // );