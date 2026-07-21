import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class CategoryHeaderCard extends StatelessWidget {
  final String title;
  final String description;
  final String icon;
  final Color? iconColor;

  const CategoryHeaderCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: context.secondaryBackground,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        spacing: 16.w,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 48.r,
            height: 48.r,
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: iconColor ?? AppColors.cyan,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x26000000),
                  blurRadius: 6,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: SvgPicture.asset(
              icon,
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcIn,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6.h,
              children: [
                Text(
                  title,
                  style: AppTextStyles.style14Bold(context),
                  textAlign: TextAlign.start,
                ),
                Text(
                  description,
                  style: AppTextStyles.style10Regular(context, color: context.secondaryTextColor),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
