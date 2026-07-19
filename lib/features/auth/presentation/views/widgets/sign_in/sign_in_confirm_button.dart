import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class SignInConfirmButton extends StatelessWidget {
  final bool enabled;
  final VoidCallback? onPressed;

  const SignInConfirmButton({
    super.key,
    required this.enabled,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: DynamicColors.primary(context),
          disabledBackgroundColor:
              DynamicColors.primary(context).withValues(alpha: 0.4),
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
