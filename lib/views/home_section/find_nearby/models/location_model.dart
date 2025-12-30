class LocationModel {
  final double latitude;
  final double longitude;
  final String title;

  LocationModel({
    required this.latitude,
    required this.longitude,
    this.title = "My Location",
  });
}
