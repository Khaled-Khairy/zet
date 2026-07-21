import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/features/challenges/data/models/challenge_filter.dart';
import 'package:zet/features/challenges/presentation/manager/challenges_cubit.dart';
import 'package:zet/features/challenges/presentation/manager/challenges_state.dart';
import 'package:zet/features/challenges/presentation/views/widgets/challenges_filter_button.dart';

class SwitchChallenges extends StatelessWidget {
  const SwitchChallenges({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChallengesCubit, ChallengesState>(
      builder: (context, state) {
        final ChallengesCubit cubit = context.read<ChallengesCubit>();

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Row(
            spacing: 10.w,
            children: [
              Expanded(
                child: ChallengeFilterButton(
                  isActive: state.filter == ChallengeFilter.current,
                  activeColor: AppColors.cyan,
                  iconAsset: AppSvgs.play,
                  label: context.tr(LocaleKeys.currentChallenges),
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  horizontalPadding: 24.w,
                  onTap: () => cubit.toggleFilter(ChallengeFilter.current),
                ),
              ),
              Expanded(
                child: ChallengeFilterButton(
                  isActive: state.filter == ChallengeFilter.past,
                  activeColor: AppColors.pink,
                  iconAsset: AppSvgs.pastChallenges,
                  label: context.tr(LocaleKeys.previousChallenges),
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  horizontalPadding: 18.w,
                  onTap: () => cubit.toggleFilter(ChallengeFilter.past),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
