import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zet/core/resources/assets.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(AppImages.splashWave),
        ),
        Center(
          child: Column(
            spacing: 16.h,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AppSvgs.logo),
              SvgPicture.asset(AppSvgs.splashText),
            ],
          ),
        ),
      ],
    );
  }
}
