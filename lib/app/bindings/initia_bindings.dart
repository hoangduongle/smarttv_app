import 'package:get/get.dart';
import 'package:smarttv_app/app/bindings/repository_bindings.dart';
import 'package:smarttv_app/app/modules/navigation/binding/navigator_binding.dart';

class InitiaBinding implements Bindings {
  @override
  void dependencies() {
    RepositoryBindings().dependencies();
    NavigationBinding().dependencies();
  }
}
