import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class PremiumFeaturesCard extends StatelessWidget {
  const PremiumFeaturesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(22.r),
      decoration: BoxDecoration(
        color: DynamicColors.secondaryBackground(context),
        borderRadius: BorderRadius.circular(22.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20.h,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AppSvgs.starSquareRounded,
                width: 25.w,
                height: 25.h,
              ),
              12.horizontalSpace,
              Text(
                context.tr(LocaleKeys.premiumFeatures),
                style: AppTextStyles.style14Bold(context),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12.h,
            children: [
              _FeatureBulletPoint(text: context.tr(LocaleKeys.feature1)),
              _FeatureBulletPoint(text: context.tr(LocaleKeys.feature2)),
              _FeatureBulletPoint(text: context.tr(LocaleKeys.feature3)),
              _FeatureBulletPoint(text: context.tr(LocaleKeys.feature4)),
            ],
          ),
          20.verticalSpace,
          Center(
            child: Column(
              spacing: 6.h,
              children: [
                Text(
                  context.tr(LocaleKeys.increaseYourWinnings),
                  style: AppTextStyles.style15Bold(context),
                ),
                Text(
                  context.tr(LocaleKeys.subscribeNow),
                  style: AppTextStyles.style15Bold(context, color: AppColors.pink),
                ),
              ],
            ),
          ),
          10.verticalSpace,
        ],
      ),
    );
  }
}

class _FeatureBulletPoint extends StatelessWidget {
  const _FeatureBulletPoint({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6.w,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '•',
          style: AppTextStyles.style14Bold(context),
        ),
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.start,
            style: AppTextStyles.style12Regular(
              context,
              color: context.textColor.withValues(alpha: 0.8),
            ),
          ),
        ),
      ],
    );
  }
}
