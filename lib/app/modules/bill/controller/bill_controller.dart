import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/bill_detail_content.dart';

class BillController extends BaseController {
  var x = 0;

  var cart = GetStorage();

  void read() {
    var listCart = cart.read("cart");
    debugPrint(listCart.toString());
  }
}
