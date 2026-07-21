import 'package:flutter/material.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/widgets/custom_app_bar.dart';
import 'package:zet/features/home/presentation/views/category_challenges/widgets/category_challenges_body.dart';

class CategoryChallengesView extends StatelessWidget {
  const CategoryChallengesView({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DynamicColors.background(context),
      appBar: CustomAppBar(
        title: title,
      ),
      body: CategoryChallengesBody(title: title),
    );
  }
}
