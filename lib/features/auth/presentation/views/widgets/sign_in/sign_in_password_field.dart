import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';
import 'package:zet/core/widgets/app_text_field.dart';

class SignInPasswordField extends StatelessWidget {
  const SignInPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 8.h,
      children: [
        AppPasswordField(
          title: context.tr(LocaleKeys.password),
        ),
        Text(
          context.tr(LocaleKeys.passwordRequirements),
          style: AppTextStyles.style12Regular(
            context,
            color: DynamicColors.offText(context),
          ),
        ),
      ],
    );
  }
}
