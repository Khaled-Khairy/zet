import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/widgets/app_bottom_nav_bar.dart';
import 'package:zet/features/home/presentation/views/widgets/brand_challenges_list_view.dart';
import 'package:zet/features/home/presentation/views/widgets/easy_challenge_list_view.dart';
import 'package:zet/features/home/presentation/views/widgets/home_challenges_categories_list_view.dart';
import 'package:zet/features/home/presentation/views/widgets/home_header.dart';
import 'package:zet/features/home/presentation/views/widgets/home_strong_challenges_list_view.dart';
import 'package:zet/features/home/presentation/views/widgets/random_challenges.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),
              16.verticalSpace,
              const HomeChallengesCategoriesListView(),
              24.verticalSpace,
              const HomeStrongChallengesListView(),
              24.verticalSpace,
              const EasyChallengeListView(),
              24.verticalSpace,
              const BrandChallengesListView(),
              24.verticalSpace,
              const RandomChallenges(),
            ],
          ),
        ),
        Positioned(
          bottom: 25.h,
          left: 60.w,
          right: 60.w,
          child: const AppBottomNavBar(currentIndex: 1),
        ),
      ],
    );
  }
}
