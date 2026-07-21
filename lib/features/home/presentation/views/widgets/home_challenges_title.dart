import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/resources/styles.dart';

class HomeChallengesTitle extends StatelessWidget {
  const HomeChallengesTitle({
    super.key,
    required this.title,
    this.subTitle,
    this.padding,
    this.trailing,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final String title;
  final String? subTitle;
  final EdgeInsets? padding;
  final Widget? trailing;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: crossAxisAlignment,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: AppTextStyles.style16Bold(context),
                ),
                if (subTitle != null) ...[
                  4.verticalSpace,
                  Text(
                    subTitle!,
                    style: AppTextStyles.style13Regular(context),
                  ),
                ],
              ],
            ),
          ),
          if (trailing != null) ...[
            10.horizontalSpace,
            trailing!,
          ],
        ],
      ),
    );
  }
}
