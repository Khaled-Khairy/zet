import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class SettingsTogglePill extends StatelessWidget {
  const SettingsTogglePill({
    super.key,
    required this.option1,
    required this.option2,
    required this.selectedIndex,
    required this.onChanged,
    this.itemWidth,
  });

  final String option1;
  final String option2;
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  final double? itemWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.r),
      decoration: BoxDecoration(
        color: DynamicColors.secondaryBackground(context),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildItem(
            context,
            title: option1,
            isSelected: selectedIndex == 0,
            onTap: () => onChanged(0),
          ),
          4.horizontalSpace,
          _buildItem(
            context,
            title: option2,
            isSelected: selectedIndex == 1,
            onTap: () => onChanged(1),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
    BuildContext context, {
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final double targetWidth = itemWidth ?? 58.w;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: targetWidth,
        height: 32.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? DynamicColors.sweetGrey(context) : Colors.transparent,
          borderRadius: BorderRadius.circular(9.r),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: isSelected
                  ? AppTextStyles.style13Bold(context)
                  : AppTextStyles.style13Regular(
                      context,
                      color: context.textColor.withValues(alpha: 0.6),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
