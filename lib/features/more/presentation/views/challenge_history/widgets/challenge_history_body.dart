import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/features/more/presentation/views/challenge_history/widgets/challenge_history_card.dart';

class ChallengeHistoryBody extends StatelessWidget {
  const ChallengeHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChallengeHistoryCardModel> items = [
      ChallengeHistoryCardModel(
        title: 'تحدي النشر',
        description: 'انشر مقطع عن أي منتج من منتجات متجرنا وخليه ي ...',
        rewardAmount: '333',
        companyName: context.tr(LocaleKeys.companyName),
        companyDescription: context.tr(LocaleKeys.companyDescription),
        statusText: context.tr(LocaleKeys.executedSuccessfully),
        date: '2025/3/23',
      ),
      ChallengeHistoryCardModel(
        title: 'تحدي الفنانين',
        description: 'انشر مقطع عن أي منتج من منتجات متجرنا وخليه ي ...',
        rewardAmount: '333',
        companyName: context.tr(LocaleKeys.companyName),
        companyDescription: context.tr(LocaleKeys.companyDescription),
        statusText: context.tr(LocaleKeys.notExecutedSuccessfully),
        date: '2025/3/24',
      ),
    ];

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      itemCount: items.length,
      separatorBuilder: (context, index) => 16.verticalSpace,
      itemBuilder: (context, index) {
        return ChallengeHistoryCard(
          model: items[index],
        );
      },
    );
  }
}
