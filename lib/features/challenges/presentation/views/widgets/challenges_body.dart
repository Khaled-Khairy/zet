import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/widgets/app_bottom_nav_bar.dart';

class ChallengesBody extends StatelessWidget {
  const ChallengesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          // ── Scrollable content ───────────────────────────────────
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.w)
                .copyWith(bottom: 100.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TODO: Add ChallengesHeader widget
                // TODO: Add ChallengesList widget
              ],
            ),
          ),
          // ── Bottom navigation ────────────────────────────────────
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AppBottomNavBar(currentIndex: 0),
          ),
        ],
      ),
    );
  }
}
