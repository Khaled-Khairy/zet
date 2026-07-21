import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zet/core/helpers/app_helpers.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: DynamicColors.secondaryBackground(context),
      titleSpacing: 0,
      title: Text(
        title,
        style: AppTextStyles.style14Bold(context),
      ),
      leading: GestureDetector(
        onTap: () => context.pop(),
        child: Container(
          margin: EdgeInsetsDirectional.all(10.r),
          decoration: BoxDecoration(
            color: DynamicColors.sweetGrey(context),
            shape: BoxShape.circle,
          ),
          child: RotatedBox(
            quarterTurns: context.isLtr ? 2 : 0,
            child: Icon(
              Icons.play_arrow_rounded,
              color: context.textColor,
            ),
          ),
        ),
      ),
      elevation: 0,
      scrolledUnderElevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
