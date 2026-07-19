import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/styles.dart';
import 'package:zet/core/widgets/app_button.dart';
import 'package:zet/features/auth/presentation/views/widgets/sign_in/sign_in_checkbox_row.dart';
import 'package:zet/features/auth/presentation/views/widgets/sign_in/sign_in_terms_text.dart';

class SignInFooter extends StatelessWidget {
  const SignInFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SignInCheckboxRow(
          label: const SignInTermsText(),
          onChanged: (v) {},
        ),
        16.verticalSpace,
        SignInCheckboxRow(
          label: Text(
            context.tr(LocaleKeys.agreeMarketingMessages),
            style: AppTextStyles.style14Regular(context),
            textAlign: TextAlign.right,
          ),
        ),
        40.verticalSpace,
        AppButton(
          onPressed: () {},
        ),
      ],
    );
  }
}
