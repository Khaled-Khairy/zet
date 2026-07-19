import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class AppTextField extends StatelessWidget {
  final String title;
  final IconData? titleIcon;
  final String hint;
  final IconData? prefixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextDirection? textDirection;
  final TextAlign textAlign;

  const AppTextField({
    super.key,
    required this.title,
    this.titleIcon,
    required this.hint,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffix,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.textDirection,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      children: [
        Row(
          children: [
            Text(
              title,
              style: AppTextStyles.style16Bold(context),
            ),
            if (titleIcon != null) Icon(titleIcon),
          ],
        ),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          style: AppTextStyles.style15Regular(context),
          textDirection: textDirection,
          textAlign: textAlign,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyles.style14Bold(context, color: AppColors.primary.withValues(alpha: 0.3)),
            suffix: suffix,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: DynamicColors.secondaryBackground(context),
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    size: 18.sp,
                    color: DynamicColors.secondaryTextColor(context),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12.w),
          ),
        ),
      ],
    );
  }
}

/// Password variant with built-in visibility toggle.
class AppPasswordField extends StatefulWidget {
  final String hint;
  final String title;

  final TextEditingController? controller;

  const AppPasswordField({
    super.key,
    this.hint = '********',
    this.controller,
    required this.title,
  });

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      title: widget.title,
      hint: widget.hint,
      prefixIcon: Icons.lock_outline_rounded,
      obscureText: _obscure,
      controller: widget.controller,
      suffixIcon: IconButton(
        onPressed: () => setState(() => _obscure = !_obscure),
        icon: Icon(
          _obscure ? Iconsax.eye : Iconsax.eye_slash,
          size: 20.sp,
          color: DynamicColors.secondaryTextColor(context),
        ),
      ),
    );
  }
}
