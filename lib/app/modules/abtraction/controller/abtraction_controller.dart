// ignore_for_file: unused_local_variable

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smarttv_app/app/core/model/bill_content.dart';

class AbtractionController extends GetxController {
  void writeStorage() async {
    GetStorage cart = GetStorage('CART');
    BillContent b = BillContent(
      id: "1",
      createDate: "",
      totalAmount: 100000,
      updateDate: "",
    );
    cart.write("CART", b);
  }

  void printStorage() async {
    GetStorage cart = GetStorage('CART');

  }
}
