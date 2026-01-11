import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../models/wallets_model.dart';

class WalletContainerItem extends StatelessWidget {
  final WalletsModel wallet;
  final VoidCallback? onTap;
  final String actionText;

  const WalletContainerItem({
    super.key,
    required this.wallet,
    this.onTap,
    this.actionText = 'Connected',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 12.h),
      child: Container(
        padding:
            EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              SizedBox(
                width: 32.w,
                height: 32.w,
                child: SvgPicture.asset(
                  wallet.icon,
                  width: 32.w,
                  height: 32.w,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      wallet.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF242424)),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      wallet.number,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF616161),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                actionText,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF247CFF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
