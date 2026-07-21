import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/routing/app_routes.dart';
import 'package:zet/core/widgets/animation_wrapper/animation_wrapper.dart';
import 'package:zet/features/home/data/models/challenge_category_model.dart';
import 'package:zet/features/home/presentation/views/home/widgets/challenge_category_card.dart';
import 'package:zet/features/home/presentation/views/home/widgets/home_horizontal_section.dart';

class HomeChallengesCategoriesListView extends StatelessWidget {
  const HomeChallengesCategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChallengeCategoryModel> categories = ChallengeCategoryModel.mockCategories;
    return HomeHorizontalSection(
      title: context.tr(LocaleKeys.challengeCategories),
      height: 79.h,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final ChallengeCategoryModel category = categories[index];
        return AnimationWrapper(
          startDelay: Duration(milliseconds: 80 * index),
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeOutQuart,
          offset: 15.0,
          direction: AppearDirection.fromBottom,
          child: ChallengeCategoryCard(
            title: category.title,
            iconAsset: category.icon,
            onTap: () => context.push(
              AppRoutes.categoryChallenges,
              extra: category.title,
            ),
          ),
        );
      },
    );
  }
}
