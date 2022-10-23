// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smarttv_app/app/bindings/initia_bindings.dart';
import 'package:smarttv_app/app/data/dio/dio_token_manager.dart';
import 'package:smarttv_app/app/routes/app_pages.dart';
import 'package:smarttv_app/app/core/utils/messages_translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TokenManager.instance.init();

  await ScreenUtil.ensureScreenSize();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        debugPrint("app in resumed");
        break;
      case AppLifecycleState.inactive:
        debugPrint("app in inactive");
        break;
      case AppLifecycleState.paused:
        debugPrint("app in paused");
        break;
      case AppLifecycleState.detached:
        debugPrint("app in detached");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    String initiaRoute = Routes.MAIN;

    // bool welcome = true;
    // if (welcome) {
    //   initiaRoute = Routes.WELCOME;
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
          ),
        );
      },
    );
  }
}
