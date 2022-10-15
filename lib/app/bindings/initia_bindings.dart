import 'package:get/get.dart';
import 'package:smarttv_app/app/bindings/repository_bindings.dart';
import 'package:smarttv_app/app/modules/alarm/binding/alarm_binding.dart';
import 'package:smarttv_app/app/modules/bill/binding/bill_binding.dart';
import 'package:smarttv_app/app/modules/cart/binding/cart_bindings.dart';
import 'package:smarttv_app/app/modules/event/binding/event_binding.dart';
import 'package:smarttv_app/app/modules/foodandbeverage/binding/foodandbeverage_binding.dart';
import 'package:smarttv_app/app/modules/home/binding/home_binding.dart';
import 'package:smarttv_app/app/modules/abtraction/binding/abtraction_binding.dart';
import 'package:smarttv_app/app/modules/main/navigation/navigator_binding.dart';
import 'package:smarttv_app/app/modules/momo/binding/momo_binding.dart';
import 'package:smarttv_app/app/modules/notification/binding/notification_binding.dart';
import 'package:smarttv_app/app/modules/receptionist/binding/receptionist_binding.dart';
import 'package:smarttv_app/app/modules/service/binding/service_binding.dart';
import 'package:smarttv_app/app/modules/service_components/binding/list_service_binding.dart';

class InitiaBinding implements Bindings {
  @override
  void dependencies() {
    AlarmBinding().dependencies();
    RepositoryBindings().dependencies();
    NavigationBinding().dependencies();

    NotificationBinding().dependencies();
    HomeBinding().dependencies();
    ServiceBinding().dependencies();

    ListServiceBinding().dependencies();
    CartBinding().dependencies();
    EventBinding().dependencies();
    AbtractionBinding().dependencies();
    BillBinding().dependencies();
    MomoBinding().dependencies();
    ReceptionistBinding().dependencies();
  }
}
