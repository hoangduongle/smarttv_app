/// define path of assets [images]

// ignore_for_file: prefer_interpolation_to_compose_strings, constant_identifier_names

class AppAssets {
  // ignore: prefer_const_declarations
  static const String imagePath = 'assets/images/';
  //png file
  static const String logo = imagePath + 'logo.png';
  static const String logoforeground = imagePath + 'logo_foreground.png';
  static const String splash = 'assets/mp4/splash.mp4';
  // jpg file
  static const String home_masterWelcome = imagePath + 'home_master.jpg';

  // overview page
  static const String overview_hotel = imagePath + 'Overview_hotel.jpg';
  static const String overview_service = imagePath + 'Overview_service.webp';
  static const String overview_food = imagePath + 'Overview_food.jpg';
  static const String overview_event = imagePath + 'Overview_event.jpg';

  //load Image
  static const String loadImage = imagePath + 'loadimage.png';

  static const String lottiesPath = 'assets/lotties/';

  static const String loadingDongHo = '${lottiesPath}loadingdongho.json';
  static const String loadingImage = '${lottiesPath}loadingImage.json';
  static const String loading = '${lottiesPath}loading.json';
  static const String alarm = '${lottiesPath}alarm.json';
  static const String done = '${lottiesPath}done.json';
  static const String uncheck = '${lottiesPath}uncheck.json';
}
