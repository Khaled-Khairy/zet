import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';
import 'package:zet/features/home/presentation/views/widgets/home_challenges_title.dart';

class RandomChallenges extends StatelessWidget {
  const RandomChallenges({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: DynamicColors.primaryPlaceHolder(context),
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
      ),
      child: Column(
        children: [
          HomeChallengesTitle(
            title: context.tr(LocaleKeys.randomChallenges),
          ),
          16.verticalSpace,
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                height: 99.h,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: DynamicColors.card(context),
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Row(
                  spacing: 8.w,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppSvgs.gift),
                    Expanded(
                      child: Column(
                        spacing: 2.h,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'تحدي الكرم',
                            style: AppTextStyles.style13Bold(context),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            'اعزم اهلك على عشاء من مطعمنا وابشر بالمكافئ ...',
                            style: AppTextStyles.style10Regular(context),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 80.h,
                      padding: EdgeInsets.all(8.h),
                      decoration: BoxDecoration(
                        color: DynamicColors.background(context),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: DynamicColors.card(context),
                              borderRadius: BorderRadius.circular(19.r),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                AppImages.tempLogo,
                                width: 40.w,
                                height: 40.w,
                              ),
                            ),
                          ),
                          Row(
                            spacing: 3.w,
                            children: [
                              SvgPicture.asset(
                                AppSvgs.reward,
                                width: 10.w,
                                height: 10.h,
                              ),
                              Text(
                                '100',
                                style: AppTextStyles.style10Bold(context),
                              ),
                              SvgPicture.asset(
                                AppSvgs.currency,
                                width: 10.w,
                                height: 10.h,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => 16.verticalSpace,
            itemCount: 20,
          ),
          100.verticalSpace,
        ],
      ),
    );
  }
}
