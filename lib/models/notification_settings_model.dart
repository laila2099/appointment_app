class NotificationSettings {
  final bool docNow;
  final bool sound;
  final bool vibrate;
  final bool appUpdates;
  final bool specialOffers;

  const NotificationSettings({
    this.docNow = true,
    this.sound = true,
    this.vibrate = true,
    this.appUpdates = false,
    this.specialOffers = true,
  });

  NotificationSettings copyWith({
    bool? docNow,
    bool? sound,
    bool? vibrate,
    bool? appUpdates,
    bool? specialOffers,
  }) {
    return NotificationSettings(
      docNow: docNow ?? this.docNow,
      sound: sound ?? this.sound,
      vibrate: vibrate ?? this.vibrate,
      appUpdates: appUpdates ?? this.appUpdates,
      specialOffers: specialOffers ?? this.specialOffers,
    );
  }
}



