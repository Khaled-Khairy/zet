import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
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
      height: 80.h,
      decoration: BoxDecoration(
        color: DynamicColors.background(context),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 20,
          ),
        ],
      ),
      child: Row(
        children: [
          _NavItem(
            icon: AppSvgs.challengesTab,
            activeIcon: AppSvgs.challengesTabActive,
            isActive: currentIndex == 0,
            onTap: () => context.go(AppRoutes.challenges),
          ),
          _NavItem(
            icon: AppSvgs.homeTab,
            activeIcon: AppSvgs.homeTabActive,
            isActive: currentIndex == 1,
            onTap: () => context.go(AppRoutes.home),
          ),
          _NavItem(
            icon: AppSvgs.moreTab,
            activeIcon: AppSvgs.moreTabActive,
            isActive: currentIndex == 2,
            onTap: () => context.go(AppRoutes.more),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String icon;
  final String activeIcon;
  final bool isActive;
  final VoidCallback? onTap;

  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.isActive,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: SvgPicture.asset(
          isActive ? activeIcon : icon,
        ),
      ),
    );
  }
}
