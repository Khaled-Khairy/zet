import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

/// Full-width confirm button for the OTP screen.
class OtpConfirmButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const OtpConfirmButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: onPressed,
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
