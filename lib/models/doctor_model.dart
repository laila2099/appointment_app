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
  final bool isRecommended;
  final String practiceExperience;

  const Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.clinic,
    required this.ratingAvg,
    required this.ratingCount,
    required this.avatarUrl,
    required this.about,
    required this.workingTime,
    required this.strNumber,
    required this.experiencePlace,
    required this.experiencePeriod,
    required this.locationText,
    required this.lat,
    required this.lng,
    required this.isRecommended,
    required this.practiceExperience,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    final reviews = (json['reviews'] is List) ? json['reviews'] as List : [];

    double computeRatingAvg() {
      final direct =
          json['rating_avg'] ?? json['average_rating'] ?? json['avg_rating'];
      if (direct != null) {
        final value = double.tryParse(direct.toString());
        if (value != null && value > 0) return value;
      }

      if (reviews.isEmpty) return 0.0;

      final ratings = reviews
          .map((r) => double.tryParse(r['rating'].toString()))
          .whereType<double>()
          .toList();

      if (ratings.isEmpty) return 0.0;
      return ratings.reduce((a, b) => a + b) / ratings.length;
    }

    int computeRatingCount() {
      final count = json['rating_count'] ??
          json['total_reviews'] ??
          json['reviews_count'];

      return int.tryParse(count?.toString() ?? '') ?? reviews.length;
    }

    double parseDouble(dynamic value) {
      return double.tryParse(value?.toString() ?? '') ?? 0.0;
    }

    return Doctor(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      specialty: json['specialization']?.toString() ??
          json['specialty']?.toString() ??
          json['category_name']?.toString() ??
          '',
      clinic: json['location']?.toString() ??
          json['clinic']?.toString() ??
          json['address']?.toString() ??
          '',
      avatarUrl: json['image_url']?.toString(),
      ratingAvg: computeRatingAvg(),
      ratingCount: computeRatingCount(),
      about: json['about']?.toString() ?? '',
      workingTime: json['working_time']?.toString() ?? '',
      strNumber: json['str_number']?.toString() ?? '',
      experiencePlace: json['experience_place']?.toString() ?? '',
      experiencePeriod: json['experience_period']?.toString() ?? '',
      locationText:
          json['location']?.toString() ?? json['address']?.toString() ?? '',
      lat: parseDouble(json['lat'] ?? json['latitude']),
      lng: parseDouble(json['lng'] ?? json['longitude']),
      isRecommended: json['is_recommended'] == true ||
          json['is_recommended'] == 'true' ||
          json['isRecommended'] == true ||
          json['isRecommended'] == 'true',
      practiceExperience: json['practice_experience']?.toString() ?? '',
    );
  }

  Doctor copyWith({
    String? id,
    String? name,
    String? specialty,
    String? clinic,
    double? ratingAvg,
    int? ratingCount,
    String? avatarUrl,
    String? about,
    String? workingTime,
    String? strNumber,
    String? experiencePlace,
    String? experiencePeriod,
    String? locationText,
    double? lat,
    double? lng,
    bool? isRecommended,
    String? practiceExperience,
  }) {
    return Doctor(
      id: id ?? this.id,
      name: name ?? this.name,
      specialty: specialty ?? this.specialty,
      clinic: clinic ?? this.clinic,
      ratingAvg: ratingAvg ?? this.ratingAvg,
      ratingCount: ratingCount ?? this.ratingCount,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      about: about ?? this.about,
      workingTime: workingTime ?? this.workingTime,
      strNumber: strNumber ?? this.strNumber,
      experiencePlace: experiencePlace ?? this.experiencePlace,
      experiencePeriod: experiencePeriod ?? this.experiencePeriod,
      locationText: locationText ?? this.locationText,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      isRecommended: isRecommended ?? this.isRecommended,
      practiceExperience: practiceExperience ?? this.practiceExperience,
    );
  }
}
