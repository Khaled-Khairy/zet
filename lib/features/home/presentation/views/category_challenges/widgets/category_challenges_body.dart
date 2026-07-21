import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/widgets/challenge_list_card.dart';
import 'package:zet/features/home/data/models/challenge_category_model.dart';
import 'package:zet/features/home/presentation/views/category_challenges/widgets/category_header_card.dart';

class CategoryChallengesBody extends StatelessWidget {
  const CategoryChallengesBody({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final ChallengeCategoryModel category = ChallengeCategoryModel.getCategoryByTitle(title);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        spacing: 14.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryHeaderCard(
            title: category.title,
            description: category.description,
            icon: category.icon,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: category.challenges.length,
            separatorBuilder: (context, index) => 14.verticalSpace,
            itemBuilder: (context, index) {
              final ChallengeItemModel challenge = category.challenges[index];
              return ChallengeListCard(
                title: challenge.title,
                description: challenge.description,
                rewardAmount: challenge.rewardAmount,
                logoAsset: challenge.logoAsset,
                leadSvgAsset: challenge.leadSvgAsset,
                leadSvgColorFilter: ColorFilter.mode(
                  context.textColor,
                  BlendMode.srcIn,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
