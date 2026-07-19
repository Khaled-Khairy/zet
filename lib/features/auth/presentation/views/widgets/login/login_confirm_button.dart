import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';
import 'package:zet/core/routing/app_routes.dart';

/// Full-width confirm button for the Login screen.
/// Navigates to the OTP page when tapped.
class LoginConfirmButton extends StatelessWidget {
  const LoginConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: () => context.push(AppRoutes.otp),
        style: ElevatedButton.styleFrom(
          backgroundColor: DynamicColors.primary(context),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28.r),
          ),
          elevation: 0,
        ),
        child: Text(
          context.tr(LocaleKeys.confirm),
          style: AppTextStyles.style18Bold(context, color: Colors.white),
        ),
      ),
    );
  }
}
