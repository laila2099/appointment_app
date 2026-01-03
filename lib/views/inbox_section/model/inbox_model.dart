class InboxModel {
  final String name;
  final String message;
  final String time;
  final String image;
  final int unreadCount;

  InboxModel({
    required this.name,
    required this.message,
    required this.time,
    required this.image,
    required this.unreadCount,
  });
}
