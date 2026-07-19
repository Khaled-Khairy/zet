import 'package:easy_localization/easy_localization.dart' as ez;
import 'package:flutter/material.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class OtpResendText extends StatelessWidget {
  final VoidCallback? onResend;

  const OtpResendText({super.key, this.onResend});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
      text: TextSpan(
        style: AppTextStyles.style13Regular(
          context,
          color: DynamicColors.offText(context),
        ),
        children: [
          TextSpan(text: '${context.tr(LocaleKeys.didNotReceiveCode)} '),
          WidgetSpan(
            child: GestureDetector(
              onTap: onResend,
              child: Text(
                context.tr(LocaleKeys.resendCode),
                style: AppTextStyles.style13SemiBold(
                  context,
                  color: DynamicColors.offText(context),
                ).copyWith(decoration: TextDecoration.underline),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
