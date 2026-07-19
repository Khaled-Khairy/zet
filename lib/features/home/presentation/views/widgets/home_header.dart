import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';
import 'package:zet/features/home/presentation/views/widgets/home_page_view.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DynamicColors.secondaryBackground(context),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    spacing: 3.h,
                    children: [
                      Text(
                        '${context.tr(LocaleKeys.hello)} محمد',
                        style: AppTextStyles.style12Regular(context),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: AppColors.cyan,
                          borderRadius: BorderRadius.circular(9.r),
                        ),
                        child: Text(
                          '${context.tr(LocaleKeys.yourMoney)} 0',
                          style: AppTextStyles.style12Regular(context),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    AppImages.zetLogoLight,
                    width: 50.w,
                    height: 37.h,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const HomeHeaderPageView(),
            ),
            12.verticalSpace,
          ],
        ),
      ),
    );
  }
}
