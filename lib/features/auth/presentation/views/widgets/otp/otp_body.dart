import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/styles.dart';
import 'package:zet/features/auth/presentation/views/widgets/otp/otp_confirm_button.dart';
import 'package:zet/features/auth/presentation/views/widgets/otp/otp_pin_input.dart';
import 'package:zet/features/auth/presentation/views/widgets/otp/otp_resend_text.dart';

/// Body of the OTP verification screen.
class OtpBody extends StatefulWidget {
  const OtpBody({super.key});

  @override
  State<OtpBody> createState() => _OtpBodyState();
}

class _OtpBodyState extends State<OtpBody> {
  String _pin = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Title ────────────────────────────────────────────────────────
        Text(
          context.tr(LocaleKeys.verifyPhoneNumber),
          style: AppTextStyles.style22Bold(context),
          textAlign: TextAlign.center,
        ),

        32.verticalSpace,

        // ── Pin Input ─────────────────────────────────────────────────────
        OtpPinInput(
          onCompleted: (pin) => setState(() => _pin = pin),
        ),

        24.verticalSpace,

        // ── Resend link ───────────────────────────────────────────────────
        OtpResendText(
          onResend: _onResend,
        ),

        const Spacer(),

        // ── Confirm Button ────────────────────────────────────────────────
        OtpConfirmButton(
          onPressed: _pin.length == 4 ? _onConfirm : null,
        ),

        24.verticalSpace,
      ],
    );
  }

  void _onResend() {
    // TODO: wire up to auth cubit
  }

  void _onConfirm() {
    // TODO: wire up to auth cubit
  }
}
