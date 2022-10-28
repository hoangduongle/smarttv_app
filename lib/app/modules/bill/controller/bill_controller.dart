import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/bill_content.dart';
import 'package:smarttv_app/app/core/model/bill_detail_content.dart';
import 'package:smarttv_app/app/core/utils/date_time_utils.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class BillController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());

  Rx<List<BillDetailContent>> billDetails = Rx<List<BillDetailContent>>([]);
  Rx<BillContent?> bill = Rx<BillContent?>(null);
  int result = 0;

  Future<void> checkVailidate() async {
    double? totalAmount = bill.value?.totalAmount;
    double billbetailAmount = 0;
    for (var element in billDetails.value) {
      billbetailAmount += element.amount!;
    }
    if (totalAmount != billbetailAmount) {
      await fetchupdateBill("Duong", "", 1, "Duong", billbetailAmount,
          DateTimeUtils.currentDate());
    }
  }

  @override
  void onInit() async {
    await fetchBillDetails(1);
    await fetchBill(1);
    await checkVailidate();
    super.onInit();
  }

  Future<void> fetchupdateBill(String createBy, String createDate, int billId,
      String lastModifyBy, double totalAmount, String updateDate) async {
    var overview = _repository.updateBillByBillId(
        createBy, createDate, billId, lastModifyBy, totalAmount, updateDate);
    await callDataService(
      overview,
      onSuccess: (int response) {
        result = response;
      },
      onError: ((dioError) {}),
    );
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
