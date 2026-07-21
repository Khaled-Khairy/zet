import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/routing/app_routes.dart';
import 'package:zet/core/widgets/animation_wrapper/animation_wrapper.dart';
import 'package:zet/core/widgets/animation_wrapper/bouncing_tap_wrapper.dart';
import 'package:zet/features/home/data/models/brand_model.dart';
import 'package:zet/features/home/presentation/manager/home_cubit.dart';

class BrandChallengesGridBody extends StatelessWidget {
  final List<BrandModel> brands;

  const BrandChallengesGridBody({
    super.key,
    required this.brands,
  });

  @override
  Widget build(BuildContext context) {
    final double squareSize = 107.w;
    final double diamondSize = squareSize * sqrt(2);

    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return AnimationWrapper(
          startDelay: Duration(milliseconds: 60 * (index % 6)),
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
