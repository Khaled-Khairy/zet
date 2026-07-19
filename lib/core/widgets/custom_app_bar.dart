import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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
        style: AppTextStyles.style16Bold(context),
      ),
      leading: GestureDetector(
        onTap: () => context.pop(),
        child: Container(
          margin: EdgeInsetsDirectional.all(10.r),
          decoration: BoxDecoration(
            color: DynamicColors.sweetGrey(context),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.play_arrow_rounded,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
