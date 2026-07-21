import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';
import 'package:zet/core/widgets/challenge_list_card.dart';
import 'package:zet/features/challenges/data/models/challenge_filter.dart';
import 'package:zet/features/challenges/presentation/manager/challenges_cubit.dart';
import 'package:zet/features/challenges/presentation/manager/challenges_state.dart';

class ChallengesBlocBuilder extends StatelessWidget {
  const ChallengesBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: BlocBuilder<ChallengesCubit, ChallengesState>(
        builder: (BuildContext context, ChallengesState state) {
          switch (state.filter) {
            case ChallengeFilter.current:
              return ChallengeListCard(
                title: 'تحدي الكرم',
                description: 'اعزم اهلك على عشاء من مطعمنا وابشر بالمكافئ ...',
                rewardAmount: '100',
                logoAsset: AppImages.tempLogo,
                trailing: Row(
                  spacing: 4.w,
                  children: [
                    Text(
                      context.tr(LocaleKeys.remainingTime),
                      style: AppTextStyles.style10Bold(context),
                    ),
                    Expanded(
                      child: Stack(
                        alignment: AlignmentGeometry.centerEnd,
                        children: [
                          Container(
                            padding: EdgeInsets.all(3.r),
                            decoration: BoxDecoration(
                              color: context.card2,
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                            child: LinearProgressIndicator(
                              value: 1 / 2,
                              minHeight: 13.h,
                              borderRadius: BorderRadius.circular(25.r),
                              color: AppColors.pink,
                              backgroundColor: context.card2,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Text(
                              '2 يوم',
                              style: AppTextStyles.style10Regular(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            case ChallengeFilter.past:
              return ChallengeListCard(
                title: 'تحدي الكرم',
                description: 'اعزم اهلك على عشاء من مطعمنا وابشر بالمكافئ ...',
                rewardAmount: '100',
                logoAsset: AppImages.tempLogo,
                trailing: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Wrap(
                    spacing: 4.w,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        context.tr(LocaleKeys.challengeStatus),
                        style: AppTextStyles.style10Bold(context),
                      ),
                      Text(
                        context.tr(LocaleKeys.challengeExpired),
                        style: AppTextStyles.style10Bold(context, color: AppColors.pink),
                      ),
                    ],
                  ),
                ),
              );
            case ChallengeFilter.none:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
