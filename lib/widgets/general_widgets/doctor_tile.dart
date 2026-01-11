import 'package:appointment_app/core/constant/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constant/app_colors.dart';

enum DoctorMetaType { rating, date }

class DoctorTile extends StatelessWidget {
  final String name;
  final String specialty;
  final String clinic;
  final double rating;
  final int reviewsCount;
  final ImageProvider avatar;

  final String? dateText;
  final String? time;

  final DoctorMetaType metaType;

  final VoidCallback? onTap;
  final VoidCallback? onChatTap;

  // config
  final EdgeInsetsGeometry padding;
  final bool asCard;
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
    required this.avatarSize,
    required this.avatarRadius,
    required this.showChat,
    required this.chatButtonSize,
    required this.chatRadius,
    required this.metaType,
    this.dateText,
    this.time,
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
    bool showChat = true,
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
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 8.h),
      asCard: false,
      avatarSize: 56,
      avatarRadius: 16,
      showChat: showChat,
      chatButtonSize: 44,
      chatRadius: BorderRadius.circular(14),
      metaType: DoctorMetaType.rating,
    );
  }

  ///  تفاصيل الطبيب مع التاريخ (بدون شادو/بدون كارد) + زر شات
  factory DoctorTile.withDate({
    Key? key,
    required String name,
    required String specialty,
    required String clinic,
    required String dateText,
    required String time,
    required ImageProvider avatar,
    VoidCallback? onTap,
    VoidCallback? onChatTap,
    bool showChat = true,
  }) {
    return DoctorTile._(
      key: key,
      name: name,
      specialty: specialty,
      clinic: clinic,
      rating: 0,
      reviewsCount: 0,
      avatar: avatar,
      onTap: onTap,
      onChatTap: onChatTap,
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 8.h),
      asCard: false,
      avatarSize: 56,
      avatarRadius: 16,
      showChat: showChat && onChatTap != null, // يظهر فقط إذا فيه onChatTap
      chatButtonSize: 44.w,
      chatRadius: BorderRadius.circular(14.r),
      metaType: DoctorMetaType.date,
      dateText: dateText,
      time: time,
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
      padding: EdgeInsetsDirectional.all(14.w),
      asCard: true,
      avatarSize: 64,
      avatarRadius: 18,
      showChat: false,
      chatButtonSize: 0,
      chatRadius: BorderRadius.zero,
      metaType: DoctorMetaType.rating,
    );
  }

  @override
  Widget build(BuildContext context) {
    final metaStyle = TextStyle(
      fontSize: 12.5.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.infoText,
    );

    final nameStyle = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    );

    final ratingStyle = TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.infoText,
    );

    final reviewsStyle = TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.infoText,
    );

    Widget content = Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(avatarRadius.r),
          child: Image(
            image: avatar,
            width: avatarSize.sp,
            height: avatarSize.sp,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 12.w),
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
                          style: nameStyle,
                        ),
                        SizedBox(height: 6.h),
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
                    _ChatButton(
                      size: chatButtonSize,
                      radius: chatRadius,
                      onTap: onChatTap!,
                    ),
                  ],
                ],
              ),
              SizedBox(height: 12.w),
              _buildMetaRow(ratingStyle, reviewsStyle),
            ],
          ),
        ),
      ],
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
        borderRadius: asCard ? BorderRadius.circular(18.r) : BorderRadius.zero,
        child: content,
      );
    }

    return content;
  }

  Widget _buildMetaRow(TextStyle ratingStyle, TextStyle reviewsStyle) {
    if (metaType == DoctorMetaType.date && dateText != null && time != null) {
      return Row(
        children: [
          Text(
            "$dateText  |  $time",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: ratingStyle,
          ),
        ],
      );
    }

    return Row(
      children: [
        Icon(Icons.star, size: 16.w, color: Colors.amber),
        SizedBox(width: 6.w),
        Text(rating.toStringAsFixed(1), style: ratingStyle),
        SizedBox(width: 6.w),
        Text("($reviewsCount reviews)", style: reviewsStyle),
      ],
    );
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
      borderRadius: radius.r,
      child: Container(
        width: size.w,
        height: size.h,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: radius.r,
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
