import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class AppButton extends StatelessWidget {
  final bool enabled;
  final VoidCallback onPressed;

  const AppButton({
    super.key,
    this.enabled = true,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 232.w,
      height: 74.h,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: DynamicColors.primary(context),
          disabledBackgroundColor: DynamicColors.primary(context).withValues(alpha: 0.4),
          overlayColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(92.r),
          ),
          elevation: 8,
        ),
        child: Text(
          context.tr(LocaleKeys.confirm),
          style: AppTextStyles.style20Bold(context, color: Colors.white),
        ),
      ),
    );
  }
}
