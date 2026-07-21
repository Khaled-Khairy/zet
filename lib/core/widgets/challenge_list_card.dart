import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class ChallengeListCard extends StatelessWidget {
  final String title;
  final String description;
  final String rewardAmount;
  final String? leadSvgAsset;
  final String? logoAsset;
  final VoidCallback? onTap;
  final Widget? trailing;

  const ChallengeListCard({
    super.key,
    required this.title,
    required this.description,
    required this.rewardAmount,
    this.leadSvgAsset,
    this.logoAsset,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: DynamicColors.card(context),
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Column(
          spacing: 6.h,
          children: [
            Row(
              spacing: 8.w,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (leadSvgAsset != null) SvgPicture.asset(leadSvgAsset!) else SvgPicture.asset(AppSvgs.gift),
                Expanded(
                  child: Column(
                    spacing: 2.h,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.style13Bold(context),
                        textAlign: TextAlign.start,
                        softWrap: true,
                      ),
                      Text(
                        description,
                        style: AppTextStyles.style10Regular(context),
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: logoAsset != null ? 80.h : null,
                  padding: logoAsset != null ? EdgeInsets.all(8.h) : EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: context.card2,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    mainAxisAlignment: logoAsset != null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (logoAsset != null)
                        Container(
                          margin: EdgeInsets.only(bottom: 4.h),
                          decoration: BoxDecoration(
                            color: DynamicColors.card(context),
                            borderRadius: BorderRadius.circular(19.r),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(19.r),
                            child: Image.asset(
                              logoAsset!,
                              width: 60.w,
                              height: 44.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 3.w,
                        children: [
                          SvgPicture.asset(
                            AppSvgs.reward,
                            width: 10.w,
                            height: 10.h,
                          ),
                          Text(
                            rewardAmount,
                            style: AppTextStyles.style10Bold(context),
                          ),
                          SvgPicture.asset(
                            AppSvgs.currency,
                            width: 10.w,
                            height: 10.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
