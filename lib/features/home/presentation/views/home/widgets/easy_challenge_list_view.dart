import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/routing/app_routes.dart';
import 'package:zet/core/widgets/animation_wrapper/animation_wrapper.dart';
import 'package:zet/core/widgets/animation_wrapper/bouncing_tap_wrapper.dart';
import 'package:zet/features/home/presentation/views/home/widgets/home_horizontal_section.dart';

class EasyChallengeListView extends StatelessWidget {
  const EasyChallengeListView({super.key});

  @override
  Widget build(BuildContext context) {
    final title = context.tr(LocaleKeys.easyChallenges);
    return HomeHorizontalSection(
      title: title,
      subTitle: context.tr(LocaleKeys.easyChallengeDescription),
      height: 127.h,
      itemCount: 5,
      itemBuilder: (context, index) {
        return AnimationWrapper(
          startDelay: Duration(milliseconds: 80 * index),
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeOutQuart,
          offset: 15.0,
          direction: AppearDirection.fromBottom,
          child: BouncingTapWrapper(
            onTap: () => context.push(AppRoutes.categoryChallenges, extra: title),
            child: Container(
              width: 102.w,
              decoration: BoxDecoration(
                color: DynamicColors.secondaryBackground(context),
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        );
      },
    );
  }
}
