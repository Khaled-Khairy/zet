import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/features/auth/presentation/views/widgets/welcome_page/welcome_buttons.dart';
import 'package:zet/features/auth/presentation/views/widgets/welcome_page/welcome_message.dart';
import 'package:zet/features/auth/presentation/views/widgets/welcome_page/welcome_page_header.dart';

class WelcomePageBody extends StatelessWidget {
  const WelcomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WelcomePageHeader(),
        Expanded(
          child: Container(
            width: double.infinity,
            color: DynamicColors.background(context),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 36.w),
                    child: const Column(
                      children: [
                        WelcomeMessage(),
                        Spacer(),
                        WelcomeButtons(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 32.h, bottom: 20.h),
                  child: Image.asset(
                    AppImages.welcomeWaves,
                    width: double.infinity,
                    height: 60.h,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
