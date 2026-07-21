import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class MoreAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MoreAppBar({
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(color: context.background, borderRadius: BorderRadius.circular(20.r)),
              child: Row(
                spacing: 4.w,
                children: [
                  SvgPicture.asset(
                    AppSvgs.notification,
                    colorFilter: ColorFilter.mode(context.textColor, BlendMode.srcIn),
                    width: 11.w,
                    height: 13.h,
                  ),
                  Text(
                    context.tr(LocaleKeys.notifications),
                    style: AppTextStyles.style11Bold(context),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 25.w),
              child: Image.asset(
                AppImages.zetLogoLight,
                width: 50.w,
                height: 37.h,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 12);
}
