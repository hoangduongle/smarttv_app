/// define path of assets [images]

// ignore_for_file: prefer_interpolation_to_compose_strings, constant_identifier_names

class AppAssets {
  // ignore: prefer_const_declarations
  static const String imagePath = 'assets/images/';
  static const String loadImageNetWork =
      'https://img.idesign.vn/2018/10/23/id-loading-1.gif';
  //png file
  static const String logo = imagePath + 'logo.png';
  static const String logoforeground = imagePath + 'logo_foreground.png';
  // jpg file
  static const String home_masterWelcome = imagePath + 'home_master.jpg';
  //lottie
  static const String lottiesPath = 'assets/lotties/';
  static const String loadingDongHo = '${lottiesPath}loadingdongho.json';
  static const String loadingImage = '${lottiesPath}loadingImage.json';
  static const String loading = '${lottiesPath}loading.json';
  static const String alarm = '${lottiesPath}alarm.json';
  static const String done = '${lottiesPath}done.json';
  static const String uncheck = '${lottiesPath}uncheck.json';
  static const String bestsale = '${lottiesPath}bestsale.json';
  static const String hot = '${lottiesPath}hot.json';

  //svg file
  static const String svgPath = 'assets/svg/';
  static const String markerRed = '${svgPath}marker_red.svg';
  static const String markerCircle = '${svgPath}marker_circle.svg';
}
