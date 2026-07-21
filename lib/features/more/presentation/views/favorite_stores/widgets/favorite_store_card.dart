import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/app_helpers.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';
import 'package:zet/core/widgets/animation_wrapper/bouncing_tap_wrapper.dart';

class FavoriteStoreModel {
  final String title;
  final String description;

  const FavoriteStoreModel({
    required this.title,
    required this.description,
  });
}

class FavoriteStoreCard extends StatelessWidget {
  const FavoriteStoreCard({
    super.key,
    required this.model,
    this.onTap,
  });

  final FavoriteStoreModel model;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BouncingTapWrapper(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: DynamicColors.secondaryBackground(context),
          borderRadius: BorderRadius.circular(22.r),
        ),
        child: Row(
          children: [
            Container(
              width: 64.r,
              height: 64.r,
              decoration: BoxDecoration(
                color: context.card2,
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            14.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4.h,
                children: [
                  Text(
                    model.title,
                    style: AppTextStyles.style14Bold(context),
                  ),
                  Text(
                    model.description,
                    style: AppTextStyles.style10Regular(
                      context,
                      color: context.textColor.withValues(alpha: 0.6),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            12.horizontalSpace,
            RotatedBox(
              quarterTurns: context.isLtr ? 0 : 2,
              child: Icon(
                Icons.arrow_left_rounded,
                size: 28.r,
                color: context.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
