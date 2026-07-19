import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/resources/colors.dart';

class SignInCheckboxRow extends StatelessWidget {
  final Widget label;
  final ValueChanged<bool>? onChanged;

  const SignInCheckboxRow({
    super.key,
    required this.label,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.w,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Checkbox(
            value: false,
            onChanged: (v) {},
            activeColor: DynamicColors.primary(context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.r),
            ),
            side: BorderSide(
              color: DynamicColors.getColor(context, light: AppColors.primary, dark: AppColors.offWhite),
              width: 1.3,
            ),
          ),
        ),
        Expanded(child: label),
      ],
    );
  }
}
