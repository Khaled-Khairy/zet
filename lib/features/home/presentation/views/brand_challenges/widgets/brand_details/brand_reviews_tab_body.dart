import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class BrandReviewsTabBody extends StatelessWidget {
  const BrandReviewsTabBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 40.h),
      alignment: Alignment.center,
      child: Text(
        context.tr(LocaleKeys.noReviewsYet),
        style: AppTextStyles.style14Bold(
          context,
          color: context.textColor.withValues(alpha: 0.5),
        ),
      ),
    );
  }
}
