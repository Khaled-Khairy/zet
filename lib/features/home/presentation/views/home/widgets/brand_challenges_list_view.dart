import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';
import 'package:zet/core/routing/app_routes.dart';
import 'package:zet/core/widgets/animation_wrapper/animation_wrapper.dart';
import 'package:zet/core/widgets/animation_wrapper/bouncing_tap_wrapper.dart';
import 'package:zet/features/home/presentation/manager/home_cubit.dart';
import 'package:zet/features/home/presentation/views/home/widgets/home_horizontal_section.dart';

class BrandChallengesListView extends StatelessWidget {
  const BrandChallengesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final double squareSize = 80.w;
    final double diamondSize = squareSize * sqrt(2);

    return HomeHorizontalSection(
      title: context.tr(LocaleKeys.brandChallenges),
      subTitle: context.tr(LocaleKeys.chooseFavoriteBrand),
      trailing: BouncingTapWrapper(
        onTap: () {
          context.push(
            AppRoutes.brandChallenges,
            extra: context.read<HomeCubit>(),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.pink,
            borderRadius: BorderRadius.circular(52.r),
          ),
          child: Text(
            context.tr(LocaleKeys.viewAll),
            style: AppTextStyles.style10Bold(context, color: Colors.white),
          ),
        ),
      ),
      height: diamondSize + 20.h,
      separator: 4.horizontalSpace,
      itemCount: 5,
      itemBuilder: (context, index) {
        return AnimationWrapper(
          startDelay: Duration(milliseconds: 80 * index),
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeOutQuart,
          offset: 15.0,
          direction: AppearDirection.fromBottom,
          child: BouncingTapWrapper(
            onTap: () {
              context.push(
                AppRoutes.brandDetails,
                extra: context.read<HomeCubit>(),
              );
            },
            child: SizedBox(
              width: diamondSize,
              height: diamondSize,
              child: Center(
                child: Transform.rotate(
                  angle: 45 * pi / 180,
                  child: Container(
                    height: squareSize,
                    width: squareSize,
                    decoration: BoxDecoration(
                      color: DynamicColors.secondaryBackground(context),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
