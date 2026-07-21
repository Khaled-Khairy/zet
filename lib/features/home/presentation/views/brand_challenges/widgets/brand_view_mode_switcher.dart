import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/features/home/data/models/brand_enums.dart';
import 'package:zet/features/home/presentation/manager/home_cubit.dart';
import 'package:zet/features/home/presentation/manager/home_state.dart';

class BrandViewModeSwitcher extends StatelessWidget {
  const BrandViewModeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeState state = context.watch<HomeCubit>().state;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Row(
        spacing: 12.w,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              if (state.brandViewMode != BrandViewMode.list) {
                context.read<HomeCubit>().toggleBrandViewMode();
              }
            },
            child: Container(
              width: 26.w,
              height: 20.w,
              decoration: BoxDecoration(
                color: state.brandViewMode == BrandViewMode.list
                    ? AppColors.pink
                    : DynamicColors.mediumGrey(context),
                borderRadius: BorderRadius.circular(6.r),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (state.brandViewMode != BrandViewMode.grid) {
                context.read<HomeCubit>().toggleBrandViewMode();
              }
            },
            child: Transform.rotate(
              angle: 45 * pi / 180,
              child: Container(
                width: 22.w,
                height: 22.w,
                decoration: BoxDecoration(
                  color: state.brandViewMode == BrandViewMode.grid
                      ? AppColors.pink
                      : DynamicColors.mediumGrey(context),
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
