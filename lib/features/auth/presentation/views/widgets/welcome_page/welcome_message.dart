import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        47.verticalSpace,
        Row(
          spacing: 32.w,
          children: [
            Text(
              context.tr(LocalKeys.welcomeToApp),
              style: AppTextStyles.style24Bold(context),
            ),
            SvgPicture.asset(
              AppSvgs.inLove,
              colorFilter: ColorFilter.mode(DynamicColors.textColor(context), BlendMode.srcIn),
            ),
          ],
        ),
        15.verticalSpace,
        Text(
          context.tr(LocalKeys.loginNow),
          style: AppTextStyles.style20Regular(context),
        ),
        Row(
          spacing: 4.w,
          children: [
            Text(
              context.tr(LocalKeys.startEarningMoney),
              style: AppTextStyles.style20Regular(context),
            ),
            SvgPicture.asset(
              AppSvgs.fire03,
              colorFilter: ColorFilter.mode(DynamicColors.textColor(context), BlendMode.srcIn),
            ),
          ],
        ),
      ],
    );
  }
}
