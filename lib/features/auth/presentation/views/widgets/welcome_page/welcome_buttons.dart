import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class WelcomeButtons extends StatelessWidget {
  const WelcomeButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          decoration: BoxDecoration(
            color: AppColors.cyan,
            borderRadius: BorderRadius.circular(22.r),
          ),
          child: Center(
            child: Text(
              context.tr(LocalKeys.createNewAccount),
              style: AppTextStyles.style20Bold(context),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.pink, width: 1.5),
            borderRadius: BorderRadius.circular(22.r),
          ),
          child: Center(
            child: Text(
              context.tr(LocalKeys.login),
              style: AppTextStyles.style20Bold(context, color: Colors.pink),
            ),
          ),
        ),
      ],
    );
  }
}
