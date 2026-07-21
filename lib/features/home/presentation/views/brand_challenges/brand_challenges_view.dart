import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/widgets/custom_app_bar.dart';
import 'package:zet/features/home/presentation/views/brand_challenges/widgets/brand_challenges/brand_challenges_body.dart';

class BrandChallengesView extends StatelessWidget {
  const BrandChallengesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DynamicColors.background(context),
      appBar: CustomAppBar(
        title: context.tr(LocaleKeys.brandChallenges),
      ),
      body: const BrandChallengesBody(),
    );
  }
}
