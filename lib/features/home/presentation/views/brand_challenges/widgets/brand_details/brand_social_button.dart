import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class BrandSocialButton extends StatelessWidget {
  final String type;
  final String platform;
  final Widget icon;
  final VoidCallback onTap;

  const BrandSocialButton({
    super.key,
    required this.type,
    required this.platform,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform.rotate(
            angle: 45 * pi / 180,
            child: Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: context.surfaceCard,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: DynamicColors.getColor(context, light: const Color(0xFFC5C5C5), dark: Colors.black),
                ),
              ),
              child: Center(
                child: Transform.rotate(
                  angle: -45 * pi / 180,
                  child: icon,
                ),
              ),
            ),
          ),
          12.verticalSpace,
          Text(
            type,
            style: AppTextStyles.style10Regular(context),
            textAlign: TextAlign.center,
          ),
          Text(
            platform,
            style: AppTextStyles.style10Regular(context),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
