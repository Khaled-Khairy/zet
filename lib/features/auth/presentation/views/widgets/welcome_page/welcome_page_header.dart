import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class WelcomePageHeader extends StatelessWidget {
  const WelcomePageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: 300.h,
          child: Align(
            alignment: Alignment.topCenter,
            child: Image.asset(AppImages.splashWave),
          ),
        ),
        Positioned(
          top: 80.h,
          left: 0,
          right: 0,
          child: Column(
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
