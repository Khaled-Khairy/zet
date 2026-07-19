import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/features/home/presentation/views/widgets/home_horizontal_section.dart';

class EasyChallengeListView extends StatelessWidget {
  const EasyChallengeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeHorizontalSection(
      title: context.tr(LocaleKeys.easyChallenges),
      subTitle: context.tr(LocaleKeys.easyChallengeDescription),
      height: 127.h,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          width: 102.w,
          decoration: BoxDecoration(
            color: DynamicColors.secondaryBackground(context),
            borderRadius: BorderRadius.circular(12.r),
          ),
        );
      },
    );
  }
}
