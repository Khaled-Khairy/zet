import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class AccountFieldCard extends StatelessWidget {
  const AccountFieldCard({
    super.key,
    required this.label,
    required this.value,
    this.onTap,
  });

  final String label;
  final String value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: DynamicColors.secondaryBackground(context),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 90.w,
            child: Text(
              label,
              textAlign: TextAlign.start,
              style: AppTextStyles.style13Bold(context),
            ),
          ),
          16.horizontalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: DynamicColors.background(context),
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Row(
                children: [
                  const Spacer(),
                  Text(
                    value,
                    style: AppTextStyles.style13Bold(context),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    AppSvgs.pencilEdit,
                    width: 18.w,
                    height: 18.h,
                    colorFilter: ColorFilter.mode(
                      context.textColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
