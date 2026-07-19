import 'package:easy_localization/easy_localization.dart' as ez;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';
import 'package:zet/core/widgets/app_text_field.dart';

class LoginPasswordField extends StatelessWidget {
  const LoginPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 55.h,
      children: [
        AppPasswordField(
          title: context.tr(LocaleKeys.password),
        ),
        RichText(
          textDirection: TextDirection.rtl,
          text: TextSpan(
            style: AppTextStyles.style13Regular(
              context,
              color: DynamicColors.offText(context),
            ),
            children: [
              TextSpan(text: '${context.tr(LocaleKeys.forgotPassword)} '),
              TextSpan(
                text: context.tr(LocaleKeys.clickHereToRecover),
                style: AppTextStyles.style13SemiBold(
                  context,
                  color: DynamicColors.offText(context),
                ).copyWith(decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
