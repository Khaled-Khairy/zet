import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class NotificationItemCard extends StatelessWidget {
  const NotificationItemCard({
    super.key,
    required this.message,
    this.svgAsset = AppSvgs.notification,
    this.iconColor,
    this.isHighlighted = false,
  });

  final String message;
  final String svgAsset;
  final Color? iconColor;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: DynamicColors.secondaryBackground(context),
        borderRadius: BorderRadius.circular(20.r),
        border: isHighlighted ? Border.all(color: AppColors.cyan, width: 1.5) : null,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            svgAsset,
            width: 16.w,
            height: 16.h,
            colorFilter: ColorFilter.mode(
              iconColor ?? context.textColor,
              BlendMode.srcIn,
            ),
          ),
          16.horizontalSpace,
          Expanded(
            child: Text(
              message,
              style: AppTextStyles.style11Bold(context),
            ),
          ),
        ],
      ),
    );
  }
}
