import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:zet/core/helpers/app_helpers.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/routing/app_routes.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77.h,
      decoration: BoxDecoration(
        color: DynamicColors.secondaryBackground(context),
        borderRadius: BorderRadius.circular(82.r),
      ),
      child: Row(
        children: [
          _NavItem(
            icon: AppSvgs.challengesTab,
            isActive: currentIndex == 0,
            activeColor: AppColors.cyan,
            onTap: () => context.go(AppRoutes.challenges),
            size: 32,
            rotateInEnglish: true,
          ),
          _NavItem(
            icon: AppSvgs.homeTab,
            isActive: currentIndex == 1,
            activeColor: AppColors.pink,
            onTap: () => context.go(AppRoutes.home),
            size: 35,
          ),
          _NavItem(
            icon: AppSvgs.moreTab,
            isActive: currentIndex == 2,
            activeColor: AppColors.pink,
            onTap: () => context.go(AppRoutes.more),
            size: 28,
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String icon;
  final bool isActive;
  final Color activeColor;
  final VoidCallback? onTap;
  final double size;
  final bool rotateInEnglish;

  static const Color _inactiveColor = Color(0xFF606060);
  static const Color _shadowColor = Color(0x40000000);
  static const double _shadowBlurSigma = 2;
  static const double _shadowOffsetY = 4;

  const _NavItem({
    required this.icon,
    required this.isActive,
    required this.activeColor,
    required this.size,
    this.onTap,
    this.rotateInEnglish = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = isActive ? activeColor : _inactiveColor;
    final bool shouldRotate = rotateInEnglish && context.isEnglish;

    Widget buildSvg({ColorFilter? colorFilter}) {
      final svg = SvgPicture.asset(
        icon,
        width: size.w,
        height: size.h,
        fit: BoxFit.contain,
        colorFilter: colorFilter ?? ColorFilter.mode(color, BlendMode.srcIn),
      );
      return shouldRotate ? RotatedBox(quarterTurns: 2, child: svg) : svg;
    }

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: isActive
              ? Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Transform.translate(
                      offset: const Offset(0, _shadowOffsetY),
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(
                          sigmaX: _shadowBlurSigma,
                          sigmaY: _shadowBlurSigma,
                        ),
                        child: buildSvg(
                          colorFilter: const ColorFilter.mode(
                            _shadowColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    buildSvg(),
                  ],
                )
              : buildSvg(),
        ),
      ),
    );
  }
}
