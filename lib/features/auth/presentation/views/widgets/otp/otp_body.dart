import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/styles.dart';
import 'package:zet/core/widgets/app_button.dart';
import 'package:zet/features/auth/presentation/views/widgets/otp/otp_pin_input.dart';
import 'package:zet/features/auth/presentation/views/widgets/otp/otp_resend_text.dart';

class OtpBody extends StatelessWidget {
  const OtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          context.tr(LocaleKeys.verifyPhoneNumber),
          style: AppTextStyles.style22Bold(context),
          textAlign: TextAlign.center,
        ),
        32.verticalSpace,
        OtpPinInput(
          onCompleted: (pin) {},
        ),
        24.verticalSpace,
        OtpResendText(
          onResend: () {},
        ),
        const Spacer(),
        AppButton(
          onPressed: () {},
        ),
        24.verticalSpace,
      ],
    );
  }
}
