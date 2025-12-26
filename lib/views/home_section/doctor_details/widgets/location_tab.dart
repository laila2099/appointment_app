import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../models/doctor_model.dart';
import 'section_title.dart';

class LocationTab extends StatelessWidget {
  final Doctor doctor;
  const LocationTab({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    final pos = LatLng(doctor.lat, doctor.lng);

    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
      children: [
        const SectionTitle("Practice Place"),
        const SizedBox(height: 12),
        Text(doctor.locationText),
        const SizedBox(height: 18),

        const SectionTitle("Location Map"),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: SizedBox(
            height: 258,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(target: pos, zoom: 13),
              markers: {
                Marker(markerId: const MarkerId("clinic"), position: pos),
              },
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              liteModeEnabled: true,
            ),
          ),
        ),
      ],
    );
  }
}
