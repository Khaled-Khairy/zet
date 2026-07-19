import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';
import 'package:zet/core/routing/app_routes.dart';

class WelcomeButtons extends StatelessWidget {
  const WelcomeButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      children: [
        GestureDetector(
          onTap: () {
            context.push(AppRoutes.signIn);
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColors.cyan,
              borderRadius: BorderRadius.circular(22.r),
            ),
            child: Center(
              child: Text(
                context.tr(LocaleKeys.createNewAccount),
                style: AppTextStyles.style20Bold(context),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            context.push(AppRoutes.login);
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 12.h),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.pink, width: 1.5),
              borderRadius: BorderRadius.circular(22.r),
            ),
            child: Center(
              child: Text(
                context.tr(LocaleKeys.login),
                style: AppTextStyles.style20Bold(context, color: Colors.pink),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
