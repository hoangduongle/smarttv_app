// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_brace_in_string_interps, avoid_print, unrelated_type_equality_checks, unused_import

import 'package:get/get.dart';
import 'package:smarttv_app/app/data/data.dart';
import 'package:smarttv_app/app/core/model/navigator_content.dart';
import 'package:smarttv_app/app/modules/home/view/home_screen.dart';

import 'package:smarttv_app/app/modules/service/view/service_screen.dart';

class NavigatorController extends GetxController {
  List<NavigationContent> navigation_list = listNavigationContent;

  var current_index = 0.obs;

  bool select = true.obs.isTrue;

}
