class UserProfile {
  final String name;
  final String email;
  final String phone;
  final String? avatarUrl;
  final String? birthdate;

  const UserProfile({
    required this.name,
    required this.email,
    required this.phone,
    this.birthdate,
    this.avatarUrl,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: (json['full_name'] ?? '') as String,
      phone: (json['phone'] ?? '') as String,
      birthdate: json['birthdate']?.toString(),
      email: (json['email'] ?? '') as String,
      avatarUrl: (json['avatar_url'] ?? '') as String,
    );
  }

  UserProfile copyWith({
    String? name,
    String? email,
    String? avatarUrl,
    String? phone,
  }) {
    return UserProfile(
      name: name ?? this.name,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      phone: phone ?? this.phone,
    );
  }
}


