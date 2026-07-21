import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class MoreActionButtonsRow extends StatelessWidget {
  const MoreActionButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 8.w,
        children: [
          _HeaderActionButton(
            title: context.tr(LocaleKeys.requestTransfer),
            iconPath: AppSvgs.transferRequest,
          ),
          _HeaderActionButton(
            title: context.tr(LocaleKeys.challengeHistory),
            iconPath: AppSvgs.charts,
          ),
          _HeaderActionButton(
            title: context.tr(LocaleKeys.favoriteStores),
            iconPath: AppSvgs.market,
          ),
          _HeaderActionButton(
            title: context.tr(LocaleKeys.contactUs),
            iconPath: AppSvgs.call,
          ),
        ],
      ),
    );
  }
}

class _HeaderActionButton extends StatelessWidget {
  const _HeaderActionButton({
    required this.title,
    required this.iconPath,
  });

  final String title;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
          decoration: BoxDecoration(
            color: context.background,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: context.actionBorder),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconPath,
                width: 24.w,
                height: 24.h,
                colorFilter: ColorFilter.mode(context.textColor, BlendMode.srcIn),
              ),
              SizedBox(height: 6.h),
              Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.style10Bold(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
