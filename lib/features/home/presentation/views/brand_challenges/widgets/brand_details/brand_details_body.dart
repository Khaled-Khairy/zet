import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';
import 'package:zet/features/home/data/models/brand_enums.dart';
import 'package:zet/features/home/presentation/manager/home_cubit.dart';
import 'package:zet/features/home/presentation/manager/home_state.dart';
import 'package:zet/features/home/presentation/views/brand_challenges/widgets/brand_details/brand_challenges_tab_body.dart';
import 'package:zet/features/home/presentation/views/brand_challenges/widgets/brand_details/brand_details_header.dart';
import 'package:zet/features/home/presentation/views/brand_challenges/widgets/brand_details/brand_reviews_tab_body.dart';

class BrandDetailsBody extends StatelessWidget {
  const BrandDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BrandDetailsHeader(),
          16.verticalSpace,
          BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, current) => previous.brandDetailsTab != current.brandDetailsTab || previous.isSubscribed != current.isSubscribed,
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  spacing: 24.h,
                  children: [
                    Row(
                      children: [
                        _BrandTabButton(
                          text: context.tr(LocaleKeys.challenges),
                          isSelected: state.brandDetailsTab == BrandDetailsTab.challenges,
                          onTap: () => context.read<HomeCubit>().selectBrandDetailsTab(BrandDetailsTab.challenges),
                        ),
                        8.horizontalSpace,
                        _BrandTabButton(
                          text: context.tr(LocaleKeys.reviews),
                          isSelected: state.brandDetailsTab == BrandDetailsTab.reviews,
                          onTap: () => context.read<HomeCubit>().selectBrandDetailsTab(BrandDetailsTab.reviews),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => context.read<HomeCubit>().toggleSubscribe(),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                            decoration: BoxDecoration(
                              color: state.isSubscribed ? DynamicColors.sweetGrey(context) : AppColors.pink,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Text(
                              state.isSubscribed ? context.tr(LocaleKeys.subscribed) : context.tr(LocaleKeys.subscribe),
                              style: AppTextStyles.style11Bold(
                                context,
                                color: state.isSubscribed ? context.textColor : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    state.brandDetailsTab == BrandDetailsTab.challenges ? const BrandChallengesTabBody() : const BrandReviewsTabBody(),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _BrandTabButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const _BrandTabButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: DynamicColors.secondaryBackground(context),
          borderRadius: BorderRadius.circular(20.r),
          border: isSelected
              ? Border.all(color: AppColors.pink, width: 1.5.r)
              : Border.all(color: Colors.transparent, width: 1.5.r),
        ),
        child: Text(
          text,
          style: AppTextStyles.style11Bold(
            context,
            color: isSelected ? AppColors.pink : context.textColor,
          ),
        ),
      ),
    );
  }
}
