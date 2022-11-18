import 'package:get/get.dart';

class PaymentController extends GetxController {
  @override
  void onInit() {
    if (Get.arguments != null) {
      // paymentResult = Get.arguments['paymentResult'];
    }
    super.onInit();
  }
}
/**
 Get.toNamed(Routes.PAYMENT_STATUS, arguments: {
                      'paymentResult': PaymentResult(
                        status: false,
                      ),
                    });

 */