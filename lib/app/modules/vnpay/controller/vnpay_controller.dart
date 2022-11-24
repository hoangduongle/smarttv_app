// import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/core/model/vnpay.dart';
import 'package:smarttv_app/app/data/repository/repository.dart';

class VNPayController extends BaseController {
  final Repository _repository = Get.find(tag: (Repository).toString());
  Rx<VNPayContent?> vnPay = Rx<VNPayContent?>(null);

  void createOrder(int orderId) {
    vnPay = Rx<VNPayContent?>(null);

    update();
  }
}
