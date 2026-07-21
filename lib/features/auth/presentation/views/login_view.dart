import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/widgets/custom_app_bar.dart';
import 'package:zet/features/auth/presentation/views/widgets/login/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(title: context.tr(LocaleKeys.login)),
      body: const LoginBody(),
    );
  }
}
