// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smarttv_app/app/bindings/initia_bindings.dart';
import 'package:smarttv_app/app/data/dio/dio_token_manager.dart';
import 'package:smarttv_app/app/routes/app_pages.dart';
import 'package:smarttv_app/app/core/utils/messages_translation.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TokenManager.instance.init();
  Intl.defaultLocale = 'vi_VN';
  initializeDateFormatting();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String initiaRoute = Routes.MAIN;

    // bool firstCheckin = true;
    // bool birthday = false;
    // if (firstCheckin) {
    //   initiaRoute = AppPages.INITIAL;
    // }

    // if (birthday) {
    //   initiaRoute = Routes.BIRTHDAY;
    // }
    return ScreenUtilInit(
      designSize: const Size(960, 540),
      minTextAdapt: true,
      builder: (context, child) {
        return Shortcuts(
          shortcuts: <LogicalKeySet, Intent>{
            LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
          },
          child: GetMaterialApp(
            title: "Smart Tv App",
            debugShowCheckedModeBanner: false,
            translations: Messages(),
            locale: Locale('vi', 'Vi'),
            // locale: Locale('en', 'US'),
            fallbackLocale: Locale('vi', 'Vi'),
            initialBinding: InitiaBinding(),
            initialRoute: initiaRoute,
            getPages: AppPages.routes,
            theme: ThemeData(),
          ),
        );
      },
    );
  }
}
