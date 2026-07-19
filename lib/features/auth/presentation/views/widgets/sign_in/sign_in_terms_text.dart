import 'package:easy_localization/easy_localization.dart' as ez;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/font_weight_helper.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class SignInTermsText extends StatelessWidget {
  const SignInTermsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      text: TextSpan(
        style: AppTextStyles.style14Regular(
          context,
          color: DynamicColors.offText(context),
        ),
        children: [
          TextSpan(text: context.tr(LocaleKeys.readAndAgree)),
          const TextSpan(text: ' '),
          TextSpan(
            text: context.tr(LocaleKeys.termsAndConditions),
            style: TextStyle(
              color: DynamicColors.offText(context),
              fontWeight: FontWeightHelper.regular,
              fontSize: 14.sp,
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(text: ' ${context.tr(LocaleKeys.and)} '),
          TextSpan(
            text: context.tr(LocaleKeys.privacyPolicy),
            style: TextStyle(
              color: DynamicColors.offText(context),
              fontWeight: FontWeightHelper.regular,
              fontSize: 14.sp,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
