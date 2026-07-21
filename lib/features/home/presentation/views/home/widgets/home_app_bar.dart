import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: DynamicColors.secondaryBackground(context),
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 25.w,
      toolbarHeight: kToolbarHeight + 12.h,
      title: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 4.h,
              children: [
                Text(
                  '${context.tr(LocaleKeys.hello)} محمد',
                  style: AppTextStyles.style12Regular(context),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: AppColors.cyan,
                    borderRadius: BorderRadius.circular(9.r),
                  ),
                  child: Text(
                    '${context.tr(LocaleKeys.yourMoney)} 0',
                    style: AppTextStyles.style12Regular(context),
                  ),
                ),
              ],
            ),
            Image.asset(
              Theme.of(context).brightness == Brightness.dark
                  ? AppImages.zetLogoDark
                  : AppImages.zetLogoLight,
              width: 50.w,
              height: 37.h,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 12);
}
