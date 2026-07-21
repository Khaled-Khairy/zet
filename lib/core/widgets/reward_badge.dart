import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class RewardBadge extends StatelessWidget {
  const RewardBadge({
    super.key,
    required this.rewardAmount,
  });

  final String rewardAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: DynamicColors.background(context),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 4.w,
        children: [
          SvgPicture.asset(
            AppSvgs.reward,
            width: 12.w,
            height: 12.h,
            colorFilter: const ColorFilter.mode(
              AppColors.pink,
              BlendMode.srcIn,
            ),
          ),
          Text(
            rewardAmount,
            style: AppTextStyles.style11Bold(context),
          ),
          SvgPicture.asset(
            AppSvgs.currency,
            width: 12.w,
            height: 12.h,
            colorFilter: ColorFilter.mode(
              context.textColor,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
