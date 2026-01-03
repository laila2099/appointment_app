class Doctor {
  final String id;
  final String name;
  final String specialty;
  final String clinic;
  final double ratingAvg;
  final int ratingCount;
  final String? avatarUrl;

  final String about;
  final String workingTime;
  final String strNumber;
  final String experiencePlace;
  final String experiencePeriod;

  final String locationText;
  final double lat;
  final double lng;

  const Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.clinic,
    required this.ratingAvg,
    required this.ratingCount,
    this.avatarUrl,
    required this.about,
    required this.workingTime,
    required this.strNumber,
    required this.experiencePlace,
    required this.experiencePeriod,
    required this.locationText,
    required this.lat,
    required this.lng,
  });
}
