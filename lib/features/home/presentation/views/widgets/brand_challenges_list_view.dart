import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';
import 'package:zet/features/home/presentation/views/widgets/home_challenges_title.dart';

class BrandChallengesListView extends StatelessWidget {
  const BrandChallengesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final double squareSize = 80.w; // the actual square before rotation
    final double diamondSize = squareSize * sqrt(2); // bounding box needed for a 45° rotation

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeChallengesTitle(
                padding: EdgeInsets.zero,
                title: context.tr(LocaleKeys.brandChallenges),
                subTitle: context.tr(LocaleKeys.chooseFavoriteBrand),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: AppColors.pink,
                  borderRadius: BorderRadius.circular(52.r),
                ),
                child: Text(
                  context.tr(LocaleKeys.viewAll),
                  style: AppTextStyles.style10Bold(context, color: Colors.white),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: diamondSize + 20.h, // match extra vertical breathing room like the other list
          child: ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 10.w,
            ),
            itemBuilder: (context, index) {
              return SizedBox(
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
              );
            },
            separatorBuilder: (context, index) => 4.horizontalSpace,
            itemCount: 5,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
