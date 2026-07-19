import 'package:easy_localization/easy_localization.dart' as ez;
import 'package:flutter/material.dart';
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
        style: AppTextStyles.style13Regular(context),
        children: [
          TextSpan(text: context.tr(LocaleKeys.readAndAgree)),
          const TextSpan(text: ' '),
          TextSpan(
            text: context.tr(LocaleKeys.termsAndConditions),
            style: AppTextStyles.style13SemiBold(
              context,
              color: DynamicColors.primary(context),
            ),
          ),
          TextSpan(text: ' ${context.tr(LocaleKeys.and)} '),
          TextSpan(
            text: context.tr(LocaleKeys.privacyPolicy),
            style: AppTextStyles.style13SemiBold(
              context,
              color: DynamicColors.primary(context),
            ),
          ),
        ],
      ),
    );
  }
}
