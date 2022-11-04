import 'package:smarttv_app/config/map_config.dart';

class BuildConfig {
  late final MapConfig mapConfig;

  static final BuildConfig _instance = BuildConfig._internal();
  BuildConfig._internal();

  static BuildConfig get instance => _instance;

  factory BuildConfig({
    required MapConfig mapConfig,
  }) {
    _instance.mapConfig = mapConfig;
    return _instance;
  }
}
