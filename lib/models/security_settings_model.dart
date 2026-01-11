class SecuritySettings {
  final bool rememberPassword;
  final bool faceId;
  final bool pin;

  const SecuritySettings({
    this.rememberPassword = true,
    this.faceId = false,
    this.pin = true,
  });

  SecuritySettings copyWith({
    bool? rememberPassword,
    bool? faceId,
    bool? pin,
  }) {
    return SecuritySettings(
      rememberPassword: rememberPassword ?? this.rememberPassword,
      faceId: faceId ?? this.faceId,
      pin: pin ?? this.pin,
    );
  }
}



