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

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: (json['id'] ?? '').toString(),
      doctorId: (json['doctor_id'] ?? json['doctorId'] ?? '').toString(),
      userName: (json['user_name'] ??
              json['userName'] ??
              json['full_name'] ??
              json['reviewer_name'] ??
              '')
          .toString(),
      userAvatarUrl: json['user_avatar_url']?.toString() ??
          json['reviewer_image']?.toString(),
      stars: int.tryParse(
              (json['stars'] ?? json['rating'] ?? json['score'] ?? 0)
                  .toString()) ??
          0,
      comment: (json['comment'] ??
              json['review_text'] ??
              json['review'] ??
              json['text'] ??
              '')
          .toString(),
      dateLabel: _formatDateLabel(json),
    );
  }

  static String _formatDateLabel(Map<String, dynamic> json) {
    final dateStr = json['created_at']?.toString() ??
        json['createdAt']?.toString() ??
        json['date']?.toString() ??
        json['date_label']?.toString();

    if (dateStr == null || dateStr.isEmpty) return 'Recently';

    try {
      if (dateStr.contains('Today') ||
          dateStr.contains('Yesterday') ||
          dateStr.contains('days ago') ||
          dateStr.contains('ago')) return dateStr;

      final date = DateTime.parse(dateStr);
      final now = DateTime.now();
      final diff = now.difference(date);

      if (diff.inDays == 0) return 'Today';
      if (diff.inDays == 1) return 'Yesterday';
      if (diff.inDays < 7) return '${diff.inDays} days ago';
      if (diff.inDays < 30) {
        final weeks = (diff.inDays / 7).floor();
        return '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
      }

      return dateStr;
    } catch (_) {
      return dateStr;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doctor_id': doctorId,
      'user_name': userName,
      'user_avatar_url': userAvatarUrl,
      'stars': stars,
      'comment': comment,
      'date_label': dateLabel,
    };
  }
}
