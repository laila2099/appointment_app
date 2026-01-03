class Review {
  final String id;
  final String doctorId;
  final String userName;
  final String? userAvatarUrl;
  final int stars;
  final String comment;
  final String dateLabel;

  const Review({
    required this.id,
    required this.doctorId,
    required this.userName,
    this.userAvatarUrl,
    required this.stars,
    required this.comment,
    required this.dateLabel,
  });
}
