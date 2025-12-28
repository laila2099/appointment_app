import 'package:app_appointment/core/constant/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constant/app_colors.dart';
import '../../core/constant/app_images.dart';

class DoctorTile extends StatelessWidget {
  final String name;
  final String specialty;
  final String clinic;
  final double rating;
  final int reviewsCount;
  final ImageProvider avatar;

  final VoidCallback? onTap;
  final VoidCallback? onChatTap;

  // config
  final EdgeInsetsGeometry padding;
  final bool asCard;
  final double height;
  final double avatarSize;
  final double avatarRadius;
  final bool showChat;
  final double chatButtonSize;
  final BorderRadius chatRadius;

  const DoctorTile._({
    required this.name,
    required this.specialty,
    required this.clinic,
    required this.rating,
    required this.reviewsCount,
    required this.avatar,
    required this.padding,
    required this.asCard,
    required this.height,
    required this.avatarSize,
    required this.avatarRadius,
    required this.showChat,
    required this.chatButtonSize,
    required this.chatRadius,
    this.onTap,
    this.onChatTap,
    super.key,
  });

  ///  تفاصيل الطبيب (بدون شادو/بدون كارد) + زر شات
  factory DoctorTile.details({
    Key? key,
    required String name,
    required String specialty,
    required String clinic,
    required double rating,
    required int reviewsCount,
    required ImageProvider avatar,
    VoidCallback? onTap,
    VoidCallback? onChatTap,
  }) {
    return DoctorTile._(
      key: key,
      name: name,
      specialty: specialty,
      clinic: clinic,
      rating: rating,
      reviewsCount: reviewsCount,
      avatar: avatar,
      onTap: onTap,
      onChatTap: onChatTap,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      asCard: false,
      height: 79,
      avatarSize: 56,
      avatarRadius: 16,
      showChat: true,
      chatButtonSize: 44,
      chatRadius: BorderRadius.circular(14),
    );
  }

  ///  كارد (قائمة الأطباء) + شادو + عادة بدون زر شات
  factory DoctorTile.card({
    Key? key,
    required String name,
    required String specialty,
    required String clinic,
    required double rating,
    required int reviewsCount,
    required ImageProvider avatar,
    VoidCallback? onTap,
  }) {
    return DoctorTile._(
      key: key,
      name: name,
      specialty: specialty,
      clinic: clinic,
      rating: rating,
      reviewsCount: reviewsCount,
      avatar: avatar,
      onTap: onTap,
      onChatTap: null,
      padding: const EdgeInsets.all(14),
      asCard: true,
      height: 92,
      avatarSize: 64,
      avatarRadius: 18,
      showChat: false,
      chatButtonSize: 0,
      chatRadius: BorderRadius.zero,
    );
  }

  @override
  Widget build(BuildContext context) {
    final metaStyle = TextStyle(
      fontSize: 12.5,
      fontWeight: FontWeight.w500,
      color: AppColors.infoText,
    );

    final nameStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    );

    final ratingStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: AppColors.infoText,
    );

    final reviewsStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.infoText,
    );

    Widget content = SizedBox(
      height: height,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(avatarRadius),
            child: Image(
              image: avatar,
              width: avatarSize,
              height: avatarSize,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // النصوص
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: nameStyle,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "$specialty  |  $clinic",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: metaStyle,
                          ),
                        ],
                      ),
                    ),

                    if (showChat && onChatTap != null) ...[
                      const SizedBox(width: 12),
                      _ChatButton(
                        size: chatButtonSize,
                        radius: chatRadius,
                        onTap: onChatTap!,
                      ),
                    ],
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.amber),
                    const SizedBox(width: 6),
                    Text(rating.toStringAsFixed(1), style: ratingStyle),
                    const SizedBox(width: 6),
                    Text("($reviewsCount reviews)", style: reviewsStyle),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

    content = Padding(padding: padding, child: content);

    if (asCard) {
      content = Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.black.withOpacity(0.05)),
          boxShadow: [
            BoxShadow(
              blurRadius: 18,
              offset: const Offset(0, 10),
              color: Colors.black.withOpacity(0.06),
            ),
          ],
        ),
        child: content,
      );
    }

    if (onTap != null) {
      content = InkWell(
        onTap: onTap,
        borderRadius: asCard ? BorderRadius.circular(18) : BorderRadius.zero,
        child: content,
      );
    }

    return content;
  }
}

class _ChatButton extends StatelessWidget {
  final double size;
  final BorderRadius radius;
  final VoidCallback onTap;

  const _ChatButton({
    required this.size,
    required this.radius,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: radius,
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: radius,
          border: Border.all(color: Colors.black.withOpacity(0.08)),
        ),
        child: SvgPicture.asset(
          AppIcons.chat,
          width: 22,
          height: 22,
          colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
        ),
      ),
    );
  }
}
