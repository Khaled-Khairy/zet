import 'package:easy_localization/easy_localization.dart' as ez;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';
import 'package:zet/core/widgets/app_text_field.dart';

class SignInPhoneField extends StatelessWidget {
  const SignInPhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 8.h,
      children: [
        AppTextField(
          title: context.tr(LocaleKeys.phoneNumber),
          titleIcon: Icons.phone_outlined,
          hint: '5********',
          textDirection: TextDirection.ltr,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.left,
          suffixIcon: Container(
            width: 69.w,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 11.w, vertical: 8.5.h),
            decoration: BoxDecoration(
              color: DynamicColors.primary(context),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              '+966',
              style: AppTextStyles.style15Bold(context, color: Colors.white),
              textDirection: TextDirection.ltr,
            ),
          ),
        ),
        Text(
          context.tr(LocaleKeys.phoneNumberUsage),
          style: AppTextStyles.style12Regular(
            context,
            color: DynamicColors.textColor(context).withValues(alpha: 0.5),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
