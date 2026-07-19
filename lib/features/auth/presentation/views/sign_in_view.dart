import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/widgets/custom_app_bar.dart';
import 'package:zet/features/auth/presentation/views/widgets/sign_in/sign_in_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.tr(LocaleKeys.createNewAccount)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: const SignInBody(),
      ),
    );
  }
}
