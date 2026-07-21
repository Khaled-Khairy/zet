import 'package:easy_localization/easy_localization.dart' as ez;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zet/core/helpers/app_helpers.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class MoreOptionsSection extends StatelessWidget {
  const MoreOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        spacing: 20.h,
        children: [
          _MoreOptionItem(
            title: context.tr(LocaleKeys.managePersonalAccount),
            iconPath: AppSvgs.person,
            width: 16.w,
            height: 19.h,
            showArrow: true,
            onTap: () {},
          ),
          _MoreOptionItem(
            title: context.tr(LocaleKeys.premiumPackage),
            iconPath: AppSvgs.star,
            width: 21.w,
            height: 21.h,
            showArrow: true,
            onTap: () {},
          ),
          _MoreOptionItem(
            title: context.tr(LocaleKeys.bankAccount),
            iconPath: AppSvgs.card,
            width: 22.w,
            height: 18.h,
            showArrow: true,
            onTap: () {},
          ),
          _MoreOptionItem(
            title: context.tr(LocaleKeys.settings),
            iconPath: AppSvgs.settings,
            width: 22.w,
            height: 20.h,
            showArrow: true,
            onTap: () {},
          ),
          _MoreOptionItem(
            title: context.tr(LocaleKeys.shareApp),
            iconPath: AppSvgs.attach,
            width: 16.w,
            height: 22.h,
            showArrow: false,
            onTap: () {},
          ),
          _MoreOptionItem(
            title: context.tr(LocaleKeys.rateApp),
            iconPath: AppSvgs.starOutline,
            width: 22.w,
            height: 22.h,
            showArrow: false,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _MoreOptionItem extends StatelessWidget {
  const _MoreOptionItem({
    required this.title,
    required this.iconPath,
    required this.width,
    required this.height,
    this.showArrow = true,
    this.onTap,
  });

  final String title;
  final String iconPath;
  final double width;
  final double height;
  final bool showArrow;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          SizedBox(
            width: 24.w,
            child: Center(
              child: SvgPicture.asset(
                iconPath,
                width: width,
                height: height,
                colorFilter: ColorFilter.mode(context.textColor, BlendMode.srcIn),
              ),
            ),
          ),
          20.horizontalSpace,
          Text(
            title,
            style: AppTextStyles.style12Bold(context),
          ),
          const Spacer(),
          if (showArrow)
            RotatedBox(
              quarterTurns: context.isRtl ? 2 : 0,
              child: Icon(
                Icons.play_arrow_rounded,
                color: context.textColor,
                size: 24.r,
              ),
            ),
        ],
      ),
    );
  }
}
