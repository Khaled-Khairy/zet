import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/widgets/app_bottom_nav_bar.dart';

class MoreBody extends StatelessWidget {
  const MoreBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          // ── Scrollable content ───────────────────────────────────
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(bottom: 100.h),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TODO: Add MoreHeader widget
                // TODO: Add MoreSettings/Options list widget
              ],
            ),
          ),
          // ── Bottom navigation ────────────────────────────────────
          Positioned(
            bottom: 25.h,
            left: 60.w,
            right: 60.w,
            child: const AppBottomNavBar(currentIndex: 2),
          ),
        ],
      ),
    );
  }
}
