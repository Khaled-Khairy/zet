import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/resources/styles.dart';
import 'package:zet/core/widgets/app_bottom_nav_bar.dart';
import 'package:zet/features/more/presentation/views/widgets/more_header_section.dart';
import 'package:zet/features/more/presentation/views/widgets/more_options_section.dart';

class MoreBody extends StatelessWidget {
  const MoreBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MoreHeaderSection(),
            const MoreOptionsSection(),
            40.verticalSpace,
            Center(
              child: Text(
                'V 1.0',
                style: AppTextStyles.style13Regular(context),
              ),
            )
          ],
        ),
        Positioned(
          bottom: 25.h,
          left: 60.w,
          right: 60.w,
          child: const AppBottomNavBar(currentIndex: 2),
        ),
      ],
    );
  }
}
