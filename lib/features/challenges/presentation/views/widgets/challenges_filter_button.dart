import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class ChallengeFilterButton extends StatelessWidget {
  const ChallengeFilterButton({
    super.key,
    required this.isActive,
    required this.activeColor,
    required this.iconAsset,
    required this.label,
    required this.mainAxisAlignment,
    required this.horizontalPadding,
    required this.onTap,
  });

  final bool isActive;
  final Color activeColor;
  final String iconAsset;
  final String label;
  final MainAxisAlignment mainAxisAlignment;
  final double horizontalPadding;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 12.h,
        ),
        decoration: BoxDecoration(
          color: isActive ? activeColor : context.card3,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconAsset,
              width: 20.w,
              height: 20.h,
              colorFilter: isActive
                  ? const ColorFilter.mode(AppColors.primary, BlendMode.srcIn)
                  : ColorFilter.mode(
                      DynamicColors.getColor(
                        context,
                        light: AppColors.primary,
                        dark: AppColors.gray,
                      ),
                      BlendMode.srcIn,
                    ),
            ),
            8.horizontalSpace,
            Flexible(
              child: Text(
                label,
                style: AppTextStyles.style12Bold(context),
                softWrap: true,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
