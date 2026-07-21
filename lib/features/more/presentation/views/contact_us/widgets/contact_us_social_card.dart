import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class ContactUsSocialCard extends StatelessWidget {
  const ContactUsSocialCard({
    super.key,
    required this.title,
    required this.iconAsset,
    this.isSvg = false,
    this.onTap,
  });

  final String title;
  final String iconAsset;
  final bool isSvg;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final Color cardBg = isDark ? const Color(0xFF262626) : const Color(0xFFD9D9D9);

    final Color pillBg = isDark ? Colors.black : Colors.white;
    final Color pillTextColor = isDark ? Colors.white : Colors.black;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 84.w,
        height: 94.h,
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(22.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              iconAsset,
              width: 24.w,
              height: 24.h,
              colorFilter: ColorFilter.mode(
                context.textColor,
                BlendMode.srcIn,
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 6.h),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: pillBg,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                title,
                style: AppTextStyles.style8Bold(
                  context,
                  color: pillTextColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
