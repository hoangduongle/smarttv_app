import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:smarttv_app/app/core/controller/animated_map_controller.dart';

class SmartMapController {
  MapController controller = MapController();


  void moveToPosition(LatLng position, {double? zoom}) {
    AnimatedMapController.init(controller: controller);
    var zoomLevel = zoom ?? controller.zoom;
    AnimatedMapController.instance.move(position, zoomLevel);
  }
}
