import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/bill_content.dart';
import 'package:smarttv_app/app/core/model/bill_detail_content.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class BillController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());

  Rx<List<BillDetailContent>> billDetails = Rx<List<BillDetailContent>>([]);
  Rx<BillContent?> bill = Rx<BillContent?>(null);
  @override
  void onInit() async {
    await fetchBill(1);
    await fetchBillDetails(1);
    super.onInit();
  }

  Future<void> fetchBill(int billId) async {
    var overview = _repository.getBillById(billId);
    await callDataService(
      overview,
      onSuccess: (BillContent response) {
        bill(response);
      },
      onError: ((dioError) {}),
    );
  }

  Future<void> fetchBillDetails(int billId) async {
    var overview = _repository.getBilldetailByBillId(billId);
    List<BillDetailContent> result = [];

    await callDataService(
      overview,
      onSuccess: (List<BillDetailContent> response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
    billDetails(result);
  }
}
