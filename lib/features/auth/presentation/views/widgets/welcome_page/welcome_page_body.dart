import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/widgets/animation_wrapper/animation_wrapper.dart';
import 'package:zet/features/auth/presentation/views/widgets/welcome_page/welcome_buttons.dart';
import 'package:zet/features/auth/presentation/views/widgets/welcome_page/welcome_message.dart';
import 'package:zet/features/auth/presentation/views/widgets/welcome_page/welcome_page_header.dart';

class WelcomePageBody extends StatelessWidget {
  const WelcomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AnimationWrapper(
          startDelay: Duration(milliseconds: 100),
          duration: Duration(milliseconds: 700),
          curve: Curves.easeOutQuart,
          offset: 15.0,
          direction: AppearDirection.fromBottom,
          child: WelcomePageHeader(),
        ),
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
                        AnimationWrapper(
                          startDelay: Duration(milliseconds: 180),
                          duration: Duration(milliseconds: 700),
                          curve: Curves.easeOutQuart,
                          offset: 15.0,
                          direction: AppearDirection.fromBottom,
                          child: WelcomeMessage(),
                        ),
                        Spacer(),
                        AnimationWrapper(
                          startDelay: Duration(milliseconds: 260),
                          duration: Duration(milliseconds: 700),
                          curve: Curves.easeOutQuart,
                          offset: 15.0,
                          direction: AppearDirection.fromBottom,
                          child: WelcomeButtons(),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 32.h, bottom: 20.h),
                  child: AnimationWrapper(
                    startDelay: const Duration(milliseconds: 340),
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeOutQuart,
                    offset: 15.0,
                    direction: AppearDirection.fromBottom,
                    child: Image.asset(
                      AppImages.welcomeWaves,
                      width: double.infinity,
                      height: 60.h,
                    ),
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
