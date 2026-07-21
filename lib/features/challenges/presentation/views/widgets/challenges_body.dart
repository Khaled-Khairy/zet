import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/widgets/app_bottom_nav_bar.dart';
import 'package:zet/features/challenges/presentation/views/widgets/active_challenges_card.dart';
import 'package:zet/features/challenges/presentation/views/widgets/challenges_bloc_builder.dart';
import 'package:zet/features/challenges/presentation/views/widgets/switch_challenges.dart';

class ChallengesBody extends StatelessWidget {
  const ChallengesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ActiveChallengesCard(),
              13.verticalSpace,
              const SwitchChallenges(),
              18.verticalSpace,
              const ChallengesBlocBuilder(),
              100.verticalSpace,
            ],
          ),
        ),
        Positioned(
          bottom: 25.h,
          left: 60.w,
          right: 60.w,
          child: const AppBottomNavBar(currentIndex: 0),
        ),
      ],
    );
  }
}
