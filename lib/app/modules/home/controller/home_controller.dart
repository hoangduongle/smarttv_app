// ignore_for_file: non_constant_identifier_names, must_call_super, unused_field




import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';

import 'package:smarttv_app/app/core/model/overview_content.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class HomeController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  // List<OverviewContent> overviewList = [];
  Rx<List<OverviewContent>> overviewList = Rx<List<OverviewContent>>([]);

  @override
  void onInit() {
    fetchOverViews();
    super.onInit();
  }

  Future<void> fetchOverViews() async {
    var overview = _repository.getListOverview();
    List<OverviewContent> result = [];

    await callDataService(
      overview,
      onSuccess: (List<OverviewContent> response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    overviewList(result);
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