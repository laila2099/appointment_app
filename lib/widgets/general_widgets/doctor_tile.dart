import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constant/app_icons.dart';
import '../../core/constant/text_style.dart';

class DoctorTile extends StatelessWidget {
  final String name;
  final String specialty;
  final String clinic;
  final double rating;
  final int reviewsCount;
  final ImageProvider avatar;

  final VoidCallback? onTap;
  final VoidCallback? onChatTap;

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
    bool? showChat,
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
      showChat: showChat ?? true,
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
    Widget content = SizedBox(
      height: height.h,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(avatarRadius),
            child: Image(
              image: avatar,
              width: avatarSize.w,
              height: avatarSize.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 14.w),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.title16W700,
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            "$specialty  |  $clinic",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.subtitle12W500,
                          ),
                        ],
                      ),
                    ),

                    if (showChat && onChatTap != null) ...[
                      SizedBox(width: 12.w),
                      _ChatButton(
                        size: chatButtonSize,
                        radius: chatRadius,
                        onTap: onChatTap!,
                      ),
                    ],
                  ],
                ),

                SizedBox(height: 10.h),

                Row(
                  children: [
                    Icon(Icons.star, size: 16.sp, color: Colors.amber),
                    SizedBox(width: 6.w),
                    Text(
                      rating.toStringAsFixed(1),
                      style: CustomTextStyles.subtitle12W500,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      "($reviewsCount reviews)",
                      style: CustomTextStyles.subtitle12W500,
                    ),
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
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(color: Colors.black.withOpacity(0.05)),
          boxShadow: [
            BoxShadow(
              blurRadius: 18.r,
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
        borderRadius: asCard ? BorderRadius.circular(18.r) : BorderRadius.zero,
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
        width: size.w,
        height: size.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: radius,
          border: Border.all(color: Colors.black.withOpacity(0.08)),
        ),
        child: SvgPicture.asset(
          AppIcons.chat,
          width: 22.w,
          height: 22.h,
          colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
        ),
      ),
    );
  }
}
