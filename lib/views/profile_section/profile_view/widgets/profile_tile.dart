import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileTile extends StatelessWidget {
  final String iconPath;
  final String title;
  final Color bgColor;
  final Color iconColor;
  final GestureTapCallback onTap;

  const ProfileTile({
    super.key,
    required this.iconPath,
    required this.title,
    required this.bgColor,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          tileColor: Colors.white,
          leading: CircleAvatar(
            backgroundColor: bgColor,
            child: SvgPicture.asset(
              iconPath,
              width: 20,
              height: 20,
              colorFilter:
                  ColorFilter.mode(iconColor, BlendMode.srcIn),
            ),
          ),
          title: Text(title),
        ),
      ),
    );
  }
}
