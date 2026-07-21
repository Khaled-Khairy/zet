import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/widgets/challenge_list_card.dart';

class BrandChallengesTabBody extends StatelessWidget {
  const BrandChallengesTabBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      separatorBuilder: (context, index) => 16.verticalSpace,
      itemBuilder: (context, index) {
        return ChallengeListCard(
          title: index == 0 ? 'تحدي النشر' : 'تحدي البيع',
          description: index == 0
              ? 'انشر مقطع عن اي منتج من منتجات متجرنا و خليه يوصل اكبر عدد مشاهدات'
              : 'سوّق لأي منتج من منتجاتنا و خلي احد يشتري من طرفك بمجموع ٢٠٠ ريال',
          rewardAmount: index == 0 ? '25' : '233',
          onTap: () {},
        );
      },
    );
  }
}
