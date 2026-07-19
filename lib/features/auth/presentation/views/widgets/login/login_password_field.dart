import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';
import 'package:zet/core/widgets/app_text_field.dart';

/// Password field for the Login screen with a "forgot password" link below it.
class LoginPasswordField extends StatelessWidget {
  const LoginPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 12.h,
      children: [
        AppPasswordField(
          title: context.tr(LocaleKeys.password),
        ),

        // ── Forgot password link ─────────────────────────────────────────
        RichText(
          textDirection: ui.TextDirection.rtl,
          text: TextSpan(
            style: AppTextStyles.style13Regular(context),
            children: [
              TextSpan(text: '${context.tr(LocaleKeys.forgotPassword)} '),
              TextSpan(
                text: context.tr(LocaleKeys.clickHereToRecover),
                style: AppTextStyles.style13SemiBold(
                  context,
                  color: DynamicColors.primary(context),
                ).copyWith(decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
