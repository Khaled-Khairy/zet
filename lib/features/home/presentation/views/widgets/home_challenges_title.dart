import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/resources/styles.dart';

class HomeChallengesTitle extends StatelessWidget {
  const HomeChallengesTitle({super.key, required this.title, this.subTitle, this.padding});

  final String title;
  final String? subTitle;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.style16Bold(context),
          ),
          if (subTitle != null)
            Text(
              subTitle ?? '',
              style: AppTextStyles.style13Regular(context),
            ),
        ],
      ),
    );
  }
}
