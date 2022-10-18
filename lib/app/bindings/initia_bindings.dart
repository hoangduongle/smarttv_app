import 'package:get/get.dart';
import 'package:smarttv_app/app/bindings/repository_bindings.dart';
import 'package:smarttv_app/app/modules/alarm/binding/alarm_binding.dart';
import 'package:smarttv_app/app/modules/main/navigation/navigator_binding.dart';

class InitiaBinding implements Bindings {
  @override
  void dependencies() {
    // AlarmBinding().dependencies();
    RepositoryBindings().dependencies();
    NavigationBinding().dependencies();
  }
}
