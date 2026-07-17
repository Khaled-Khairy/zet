import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';
import 'package:zet/features/auth/presentation/views/widgets/welcome_page/welcome_page_header.dart';

class WelcomePageBody extends StatelessWidget {
  const WelcomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WelcomePageHeader(),
        Expanded(
          child: Container(
            width: double.infinity,
            color: DynamicColors.background(context),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.w),
              child: Column(
                children: [
                  Column(
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
                  ),
                  const Spacer(),
                  Column(
                    spacing: 16.h,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        decoration: BoxDecoration(
                          color: AppColors.cyan,
                          borderRadius: BorderRadius.circular(22.r),
                        ),
                        child: Center(
                          child: Text(
                            context.tr(LocalKeys.createNewAccount),
                            style: AppTextStyles.style20Bold(context),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.pink, width: 1.5),
                          borderRadius: BorderRadius.circular(22.r),
                        ),
                        child: Center(
                          child: Text(
                            context.tr(LocalKeys.login),
                            style: AppTextStyles.style20Bold(context, color: Colors.pink),
                          ),
                        ),
                      ),
                    ],
                  ),
                  32.verticalSpace,
                  Image.asset(AppImages.welcomeWaves),
                  20.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
