import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';

class BillController extends BaseController {
  var billDetail = {}.obs;

  void printBill() {
    debugPrint(billDetail.toString());
  }
}
