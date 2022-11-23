import 'package:get/get.dart';

class CartdialogController extends GetxController {
  var count = 1.obs;

  void increment() {
    count++;
  }

  void decrement() {
    count--;
  }
}
