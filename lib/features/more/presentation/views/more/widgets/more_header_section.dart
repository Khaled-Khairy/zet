import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';
import 'package:zet/features/more/presentation/views/more/widgets/more_action_buttons_row.dart';

class MoreHeaderSection extends StatelessWidget {
  const MoreHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 8.h),
      color: context.secondaryBackground,
      child: Column(
        spacing: 8.h,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
            decoration: BoxDecoration(
              color: context.background,
              borderRadius: BorderRadius.circular(18.r),
              border: Border.all(color: context.border),
            ),
            child: Row(
              spacing: 16.w,
              children: [
                CircleAvatar(
                  backgroundColor: context.surfaceGrey,
                  radius: 34.r,
                ),
                Column(
                  spacing: 4.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${context.tr(LocaleKeys.hello)} محمد',
                      style: AppTextStyles.style15Bold(context),
                    ),
                    Text(
                      '${context.tr(LocaleKeys.currentBalance)} : 0 ${context.tr(LocaleKeys.riyals)}',
                      style: AppTextStyles.style11Regular(context),
                    ),
                  ],
                )
              ],
            ),
          ),
          const MoreActionButtonsRow(),
        ],
      ),
    );
  }
}
