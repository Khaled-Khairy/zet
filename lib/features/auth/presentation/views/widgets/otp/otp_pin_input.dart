import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:zet/core/resources/colors.dart';

/// 4-cell OTP pin input styled to match the mockup.
/// Wrapped in [Directionality] with LTR so digits always flow left-to-right.
class OtpPinInput extends StatelessWidget {
  final ValueChanged<String>? onCompleted;

  const OtpPinInput({super.key, this.onCompleted});

  @override
  Widget build(BuildContext context) {
    final cellDecoration = BoxDecoration(
      color: DynamicColors.secondaryBackground(context),
      borderRadius: BorderRadius.circular(16.r),
    );

    final focusedDecoration = BoxDecoration(
      color: DynamicColors.secondaryBackground(context),
      borderRadius: BorderRadius.circular(16.r),
      border: Border.all(
        color: DynamicColors.primary(context),
        width: 2,
      ),
    );

    final defaultTheme = PinTheme(
      width: 72.w,
      height: 72.h,
      textStyle: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: DynamicColors.textColor(context),
      ),
      decoration: cellDecoration,
    );

    final focusedTheme = defaultTheme.copyWith(
      decoration: focusedDecoration,
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        length: 4,
        defaultPinTheme: defaultTheme,
        focusedPinTheme: focusedTheme,
        submittedPinTheme: defaultTheme,
        keyboardType: TextInputType.number,
        onCompleted: onCompleted,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
    );
  }
}
