import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class ActiveChallengesCard extends StatelessWidget {
  const ActiveChallengesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 16.h),
      color: context.secondaryBackground,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: context.background,
          borderRadius: BorderRadius.circular(27.r),
          border: Border.all(color: context.border),
        ),
        child: Column(
          spacing: 18.h,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  spacing: 4.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${context.tr(LocaleKeys.hello)} محمد',
                      style: AppTextStyles.style15Bold(context),
                    ),
                    Text(
                      context.tr(LocaleKeys.challengePageDescription),
                      style: AppTextStyles.style12Regular(context),
                    ),
                  ],
                ),
                SvgPicture.asset(
                  AppSvgs.target,
                  width: 63.w,
                  height: 63.h,
                  colorFilter: ColorFilter.mode(
                    context.textColor,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
            Column(
              spacing: 6.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '1/3 ${context.tr(LocaleKeys.activeChallenges)}',
                  style: AppTextStyles.style10Bold(context),
                ),
                Container(
                  padding: EdgeInsets.all(4.r),
                  decoration: BoxDecoration(
                    color: context.cardBackground,
                    borderRadius: BorderRadius.circular(111.r),
                  ),
                  child: LinearProgressIndicator(
                    value: 1 / 3,
                    minHeight: 28.h,
                    borderRadius: BorderRadius.circular(111.r),
                    color: AppColors.cyan,
                    backgroundColor: context.cardBackground,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
