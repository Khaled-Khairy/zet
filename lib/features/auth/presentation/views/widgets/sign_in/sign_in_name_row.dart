import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/widgets/app_text_field.dart';

class SignInNameRow extends StatelessWidget {
  const SignInNameRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 24.w,
      children: [
        Expanded(
          child: AppTextField(
            title: context.tr(LocaleKeys.firstName),
            hint: context.tr(LocaleKeys.writeHere),
          ),
        ),
        Expanded(
          child: AppTextField(
            title: context.tr(LocaleKeys.lastName),
            hint: context.tr(LocaleKeys.writeHere),
          ),
        ),
      ],
    );
  }
}
