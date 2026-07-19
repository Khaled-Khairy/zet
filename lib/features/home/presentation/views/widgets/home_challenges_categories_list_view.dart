import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';
import 'package:zet/features/home/presentation/views/widgets/home_challenges_title.dart';

class HomeChallengesCategoriesListView extends StatelessWidget {
  const HomeChallengesCategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeChallengesTitle(
          title: context.tr(LocaleKeys.challengeCategories),
        ),
        SizedBox(
          height: 79.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.w),
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: DynamicColors.secondaryBackground(context),
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    )
                  ],
                ),
                child: Row(
                  spacing: 10.w,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        color: AppColors.cyan,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: const Icon(Icons.share),
                    ),
                    Text(
                      'تحديات النشر',
                      style: AppTextStyles.style14Regular(context),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => 15.horizontalSpace,
            itemCount: 5,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
