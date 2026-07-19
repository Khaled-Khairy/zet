import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

/// "لم يصلك الرمز ؟  اضغط هنا لإعادة إرساله"
/// Mirrors the [SignInTermsText] pattern with a tappable bold underlined segment.
class OtpResendText extends StatelessWidget {
  final VoidCallback? onResend;

  const OtpResendText({super.key, this.onResend});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      textDirection: ui.TextDirection.rtl,
      text: TextSpan(
        style: AppTextStyles.style13Regular(context),
        children: [
          TextSpan(text: '${context.tr(LocaleKeys.didNotReceiveCode)} '),
          WidgetSpan(
            child: GestureDetector(
              onTap: onResend,
              child: Text(
                context.tr(LocaleKeys.resendCode),
                style: AppTextStyles.style13SemiBold(
                  context,
                  color: DynamicColors.primary(context),
                ).copyWith(decoration: TextDecoration.underline),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
