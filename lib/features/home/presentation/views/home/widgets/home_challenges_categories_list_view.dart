import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/features/home/presentation/views/home/widgets/challenge_category_card.dart';
import 'package:zet/features/home/presentation/views/home/widgets/home_horizontal_section.dart';

class HomeChallengesCategoriesListView extends StatelessWidget {
  const HomeChallengesCategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeHorizontalSection(
      title: context.tr(LocaleKeys.challengeCategories),
      height: 79.h,
      itemCount: 5,
      itemBuilder: (context, index) {
        return const ChallengeCategoryCard(
          title: 'تحديات النشر',
          icon: Icon(Icons.share),
        );
      },
    );
  }
}
