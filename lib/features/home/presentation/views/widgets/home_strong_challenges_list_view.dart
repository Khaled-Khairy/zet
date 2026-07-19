import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/features/home/presentation/views/widgets/home_challenges_title.dart';

class HomeStrongChallengesListView extends StatelessWidget {
  const HomeStrongChallengesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeChallengesTitle(
          title: context.tr(LocaleKeys.strongChallenges),
          subTitle: context.tr(LocaleKeys.strongChallengeDescription),
        ),
        SizedBox(
          height: 127.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.w),
            itemBuilder: (context, index) {
              return Container(
                height: 97.h,
                width: 210.w,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: DynamicColors.secondaryBackground(context),
                  borderRadius: BorderRadius.circular(12.r),
                ),
              );
            },
            separatorBuilder: (context, index) => 15.horizontalSpace,
            itemCount: 5,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
