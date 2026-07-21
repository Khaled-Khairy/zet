import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';
import 'package:zet/features/home/presentation/views/brand_challenges/widgets/brand_details/brand_social_button.dart';

class BrandDetailsHeader extends StatelessWidget {
  const BrandDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: context.secondaryBackground,
      ),
      child: Column(
        spacing: 32.h,
        children: [
          Row(
            spacing: 16.w,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 64.r,
                height: 64.r,
                decoration: BoxDecoration(
                  color: context.surfaceCard,
                  shape: BoxShape.circle,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr(LocaleKeys.companyName),
                      style: AppTextStyles.style18Bold(context),
                    ),
                    8.verticalSpace,
                    Text(
                      context.tr(LocaleKeys.companyDetailedDescription),
                      style: AppTextStyles.style11Regular(
                        context,
                        color: context.textColor.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            spacing: 20.w,
            children: [
              BrandSocialButton(
                type: context.tr(LocaleKeys.officialWebsite).split('\n').first,
                platform: context.tr(LocaleKeys.officialWebsite).split('\n').last,
                icon: SvgPicture.asset(
                  AppSvgs.market2,
                  width: 20.r,
                  height: 20.r,
                  colorFilter: ColorFilter.mode(
                    context.textColor,
                    BlendMode.srcIn,
                  ),
                ),
                onTap: () {},
              ),
              BrandSocialButton(
                type: context.tr(LocaleKeys.instagramAccount).split('\n').first,
                platform: context.tr(LocaleKeys.instagramAccount).split('\n').last,
                icon: SvgPicture.asset(
                  AppSvgs.instagram2,
                  width: 20.r,
                  height: 20.r,
                  colorFilter: ColorFilter.mode(
                    context.textColor,
                    BlendMode.srcIn,
                  ),
                ),
                onTap: () {},
              ),
              BrandSocialButton(
                type: context.tr(LocaleKeys.tiktokAccount).split('\n').first,
                platform: context.tr(LocaleKeys.tiktokAccount).split('\n').last,
                icon: SvgPicture.asset(
                  AppSvgs.tiktok2,
                  width: 20.r,
                  height: 20.r,
                  colorFilter: ColorFilter.mode(
                    context.textColor,
                    BlendMode.srcIn,
                  ),
                ),
                onTap: () {},
              ),
              const Spacer(),
              BrandSocialButton(
                type: context.tr(LocaleKeys.downloadApp).split('\n').first,
                platform: context.tr(LocaleKeys.downloadApp).split('\n').last,
                icon: SvgPicture.asset(
                  AppSvgs.download,
                  width: 20.r,
                  height: 20.r,
                  colorFilter: ColorFilter.mode(
                    context.textColor,
                    BlendMode.srcIn,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
