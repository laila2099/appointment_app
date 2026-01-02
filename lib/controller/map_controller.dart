import 'package:get/get.dart';
import '../views/home_section/find_nearby/models/location_model.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  // الموقع الحالي
  var currentLocation = LocationModel(
    latitude: 37.4221,
    longitude: -122.0841,
  ).obs;

  // Google Map Controller
  late GoogleMapController mapController;

  // تحديث الموقع
  void updateLocation(double lat, double lng, {String title = "My Location"}) {
    currentLocation.value = LocationModel(
      latitude: lat,
      longitude: lng,
      title: title,
    );
  }

  // إخفاء أسماء الخريطة
  Future<void> hideLabels() async {
    final style =
        await rootBundle.loadString('assets/map_no_labels.json');
    mapController.setMapStyle(style);
  }
}
