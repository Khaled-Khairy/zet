import 'package:flutter/material.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/features/auth/presentation/views/widgets/welcome_page/welcome_page_body.dart';

class WelcomePageView extends StatelessWidget {
  const WelcomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primary,
      body: WelcomePageBody(),
    );
  }
}
