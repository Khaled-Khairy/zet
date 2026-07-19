import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/widgets/app_bottom_nav_bar.dart';

class ChallengesBody extends StatelessWidget {
  const ChallengesBody({super.key});

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
                // TODO: Add ChallengesHeader widget
                // TODO: Add ChallengesList widget
              ],
            ),
          ),
          // ── Bottom navigation ────────────────────────────────────
          Positioned(
            bottom: 25.h,
            left: 60.w,
            right: 60.w,
            child: const AppBottomNavBar(currentIndex: 0),
          ),
        ],
      ),
    );
  }
}
