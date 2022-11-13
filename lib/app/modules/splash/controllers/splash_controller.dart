import 'package:get/get.dart';
import 'package:smarttv_app/app/core/values/app_assets.dart';
import 'package:smarttv_app/app/routes/app_pages.dart';
import 'package:video_player/video_player.dart';

class SplashController extends GetxController {
  late VideoPlayerController videoPlayerController;

  @override
  Future<void> onInit() async {
    _initializedPlayer();
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await Future.delayed(const Duration(seconds: 3, milliseconds: 500));

    Get.offAllNamed(Routes.MAIN);

    super.onReady();
  }

  Future<void> _initializedPlayer() async {
    videoPlayerController = VideoPlayerController.asset(AppAssets.splash)
      ..setVolume(0.0);
    videoPlayerController.initialize().then((_) => (update()));
    videoPlayerController.play();
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    super.onClose();
  }
}
