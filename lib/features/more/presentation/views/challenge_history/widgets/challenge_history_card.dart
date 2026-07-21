import 'dart:math';

import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zet/core/helpers/app_helpers.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';
import 'package:zet/core/widgets/reward_badge.dart';

class ChallengeHistoryCardModel {
  final String title;
  final String description;
  final String rewardAmount;
  final String companyName;
  final String companyDescription;
  final String statusText;
  final String date;

  const ChallengeHistoryCardModel({
    required this.title,
    required this.description,
    required this.rewardAmount,
    required this.companyName,
    required this.companyDescription,
    required this.statusText,
    required this.date,
  });
}

class ChallengeHistoryCard extends StatelessWidget {
  const ChallengeHistoryCard({
    super.key,
    required this.model,
  });

  final ChallengeHistoryCardModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: context.secondaryBackground,
        borderRadius: BorderRadius.circular(22.r),
      ),
      child: Column(
        spacing: 12.h,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                AppSvgs.tempGlobe,
                width: 64.w,
                height: 64.h,
                colorFilter: ColorFilter.mode(
                  context.textColor,
                  BlendMode.srcIn,
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4.h,
                  children: [
                    Text(
                      model.title,
                      style: AppTextStyles.style14Bold(context),
                    ),
                    Text(
                      model.description,
                      style: AppTextStyles.style10Regular(context),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              12.horizontalSpace,
              RewardBadge(rewardAmount: model.rewardAmount),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: DynamicColors.background(context),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Row(
              children: [
                Container(
                  width: 44.r,
                  height: 44.r,
                  decoration: BoxDecoration(
                    color: context.surfaceCard,
                    shape: BoxShape.circle,
                  ),
                ),
                12.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 2.h,
                    children: [
                      Text(
                        model.companyName,
                        style: AppTextStyles.style12Bold(context),
                      ),
                      Text(
                        model.companyDescription,
                        style: AppTextStyles.style10Regular(context),
                      ),
                    ],
                  ),
                ),
                12.horizontalSpace,
                Transform.rotate(
                  angle: 45 * pi / 180,
                  child: Container(
                    width: 36.r,
                    height: 36.r,
                    decoration: BoxDecoration(
                      color: AppColors.pink,
                      borderRadius: BorderRadius.circular(3.r),
                    ),
                    child: Center(
                      child: Transform.rotate(
                        angle: -45 * pi / 180 + (context.isRtl ? pi : 0),
                        child: Transform.translate(
                          offset: Offset(context.isRtl ? 2.w : -2.w, 0),
                          child: Icon(
                            Icons.arrow_left_rounded,
                            color: Colors.white,
                            size: 34.r,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: DynamicColors.background(context),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              children: [
                Text(
                  '${context.tr(LocaleKeys.challengeStatus)} ',
                  style: AppTextStyles.style12Bold(context),
                ),
                Text(
                  model.statusText,
                  style: AppTextStyles.style12Regular(context),
                ),
                const Spacer(),
                Text(
                  model.date,
                  style: AppTextStyles.style12Bold(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
