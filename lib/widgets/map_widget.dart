import 'package:appointment_app/controller/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatelessWidget {
  MapWidget({super.key});

  final MapController mapController = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final location = mapController.currentLocation.value;

      return GoogleMap(
        initialCameraPosition:
            const CameraPosition(target: LatLng(24.7136, 46.6753), zoom: 20),

        // تثبيت الخريطة
        minMaxZoomPreference: const MinMaxZoomPreference(15, 15),
        scrollGesturesEnabled: false,
        zoomGesturesEnabled: false,
        rotateGesturesEnabled: false,
        tiltGesturesEnabled: false,
        zoomControlsEnabled: false,
        compassEnabled: false,
        mapToolbarEnabled: false,

        onMapCreated: (GoogleMapController controller) {
          mapController.mapController = controller;
          mapController.hideLabels();
        },
      );
    });
  }
}
