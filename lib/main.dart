import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smarttv_app/app/bindings/initia_bindings.dart';
import 'package:smarttv_app/app/core/controller/network_controller.dart';
import 'package:smarttv_app/app/core/dio/dio_token_manager.dart';
import 'package:smarttv_app/app/routes/app_pages.dart';
import 'package:smarttv_app/app/core/utils/messages_translation.dart';
import 'package:smarttv_app/config/build_config.dart';
import 'package:smarttv_app/config/map_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.remove();
  MapConfig mapConfig = MapConfig(
    mapboxUrlTemplate:
        'https://api.mapbox.com/styles/v1/lehhoangduong/cl9xnm59q00j714o2ltpm3mdp/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibGVoaG9hbmdkdW9uZyIsImEiOiJjbDl4cGExdjkwMjFuM25xcW00eXI2aXVmIn0.KIUtgALNKjfp1fWry_3vwQ',
    mapboxAccessToken:
        'pk.eyJ1IjoibGVoaG9hbmdkdW9uZyIsImEiOiJjbDl4cGExdjkwMjFuM25xcW00eXI2aXVmIn0.KIUtgALNKjfp1fWry_3vwQ',
    mapboxId: 'mapbox.mapbox-streets-v8',
  );

  BuildConfig(
    mapConfig: mapConfig,
  );

  NetworkController.intance.init();

  await TokenManager.instance.init();
  await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
            locale: const Locale('vi', 'Vi'),
            // locale: Locale('en', 'US'),
            fallbackLocale: const Locale('vi', 'Vi'),
            initialBinding: InitiaBinding(),
            initialRoute: initiaRoute,
            getPages: AppPages.routes,
          ),
        );
      },
    );
  }
}
