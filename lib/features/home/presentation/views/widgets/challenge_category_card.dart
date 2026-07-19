import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class ChallengeCategoryCard extends StatelessWidget {
  final String title;
  final Widget icon;
  final Color? iconContainerColor;
  final VoidCallback? onTap;

  const ChallengeCategoryCard({
    super.key,
    required this.title,
    required this.icon,
    this.iconContainerColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: DynamicColors.secondaryBackground(context),
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 4),
            )
          ],
        ),
        child: Row(
          spacing: 10.w,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: iconContainerColor ?? AppColors.cyan,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: icon,
            ),
            Text(
              title,
              style: AppTextStyles.style14Regular(context),
            ),
          ],
        ),
      ),
    );
  }
}
