import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class ProfilePictureCard extends StatelessWidget {
  const ProfilePictureCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: DynamicColors.secondaryBackground(context),
        borderRadius: BorderRadius.circular(22.r),
      ),
      child: Row(
        children: [
          Container(
            width: 48.r,
            height: 48.r,
            decoration: BoxDecoration(
              color: DynamicColors.sweetGrey(context),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                AppSvgs.pencilEdit,
                width: 20.w,
                height: 20.h,
                colorFilter: ColorFilter.mode(
                  context.textColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          16.horizontalSpace,
          Text(
            context.tr(LocaleKeys.profilePicture),
            style: AppTextStyles.style14Bold(context),
          ),
          const Spacer(),
          Text(
            context.tr(LocaleKeys.editPicture),
            style: AppTextStyles.style10Regular(
              context,
              color: context.textColor.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}
