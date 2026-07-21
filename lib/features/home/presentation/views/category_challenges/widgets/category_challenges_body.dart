import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/core/widgets/challenge_list_card.dart';

class CategoryChallengesBody extends StatelessWidget {
  const CategoryChallengesBody({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      itemCount: 10,
      separatorBuilder: (context, index) => 14.verticalSpace,
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
    );
  }
}
