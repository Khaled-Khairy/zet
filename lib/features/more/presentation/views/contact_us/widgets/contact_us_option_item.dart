import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zet/core/helpers/app_helpers.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class ContactUsOptionItem extends StatelessWidget {
  const ContactUsOptionItem({
    super.key,
    required this.title,
    required this.iconAsset,
    this.onTap,
  });

  final String title;
  final String iconAsset;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 14.h),
        child: Row(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 12.w,
              children: [
                SvgPicture.asset(
                  iconAsset,
                  width: 22.w,
                  height: 22.h,
                  colorFilter: ColorFilter.mode(
                    context.textColor,
                    BlendMode.srcIn,
                  ),
                ),
                Text(
                  title,
                  style: AppTextStyles.style12Bold(context),
                ),
              ],
            ),
            const Spacer(),
            RotatedBox(
              quarterTurns: context.isRtl ? 2 : 0,
              child: Icon(
                Icons.play_arrow_rounded,
                size: 16.r,
                color: context.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
