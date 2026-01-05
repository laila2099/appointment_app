class AuthSession {
  final String accessToken;
  final String refreshToken;
  final int expiresIn;
  final String userId;

  AuthSession({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
    required this.userId,
  });

  factory AuthSession.fromJson(Map<String, dynamic> json) {
    final user = (json['user'] ?? {}) as Map<String, dynamic>;
    return AuthSession(
      accessToken: (json['access_token'] ?? '') as String,
      refreshToken: (json['refresh_token'] ?? '') as String,
      expiresIn: (json['expires_in'] ?? 0) as int,
      userId: (user['id'] ?? '') as String,
    );
  }
}
