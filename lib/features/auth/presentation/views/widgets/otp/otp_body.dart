import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/styles.dart';
import 'package:zet/core/routing/app_routes.dart';
import 'package:zet/core/widgets/animation_wrapper/animation_wrapper.dart';
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
        AnimationWrapper(
          startDelay: const Duration(milliseconds: 100),
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeOutQuart,
          offset: 15.0,
          direction: AppearDirection.fromBottom,
          child: Text(
            context.tr(LocaleKeys.verifyPhoneNumber),
            style: AppTextStyles.style22Bold(context),
            textAlign: TextAlign.center,
          ),
        ),
        32.verticalSpace,
        AnimationWrapper(
          startDelay: const Duration(milliseconds: 180),
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeOutQuart,
          offset: 15.0,
          direction: AppearDirection.fromBottom,
          child: OtpPinInput(
            onCompleted: (pin) {},
          ),
        ),
        24.verticalSpace,
        AnimationWrapper(
          startDelay: const Duration(milliseconds: 260),
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeOutQuart,
          offset: 15.0,
          direction: AppearDirection.fromBottom,
          child: OtpResendText(
            onResend: () {},
          ),
        ),
        const Spacer(),
        AnimationWrapper(
          startDelay: const Duration(milliseconds: 340),
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeOutQuart,
          offset: 15.0,
          direction: AppearDirection.fromBottom,
          child: AppButton(
            onPressed: () {
              context.go(AppRoutes.home);
            },
          ),
        ),
        24.verticalSpace,
      ],
    );
  }
}
