import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/widgets/challenge_list_card.dart';
import 'package:zet/features/home/presentation/views/widgets/home_challenges_title.dart';

class RandomChallenges extends StatelessWidget {
  const RandomChallenges({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: DynamicColors.primaryPlaceHolder(context),
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HomeChallengesTitle(
            title: context.tr(LocaleKeys.randomChallenges),
          ),
          16.verticalSpace,
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return const ChallengeListCard(
                title: 'تحدي الكرم',
                description: 'اعزم اهلك على عشاء من مطعمنا وابشر بالمكافئ ...',
                rewardAmount: '100',
                logoAsset: AppImages.tempLogo,
                rewardIconAsset: AppSvgs.reward,
                currencyIconAsset: AppSvgs.currency,
              );
            },
            separatorBuilder: (context, index) => 16.verticalSpace,
            itemCount: 20,
          ),
          100.verticalSpace,
        ],
      ),
    );
  }
}
