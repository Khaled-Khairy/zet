import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/app_helpers.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class SettingsOptionItem extends StatelessWidget {
  const SettingsOptionItem({
    super.key,
    required this.title,
    required this.icon,
    this.trailing,
    this.onTap,
  });

  final String title;
  final Widget icon;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        child: Row(
          children: [
            SizedBox(
              width: 24.w,
              height: 24.h,
              child: Center(child: icon),
            ),
            14.horizontalSpace,
            Text(
              title,
              style: AppTextStyles.style14Bold(context),
            ),
            const Spacer(),
            if (trailing != null)
              trailing!
            else
              RotatedBox(
                quarterTurns: context.isRtl ? 2 : 0,
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: context.textColor,
                  size: 22.r,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
