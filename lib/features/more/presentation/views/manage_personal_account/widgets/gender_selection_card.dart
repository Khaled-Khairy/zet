import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class GenderSelectionCard extends StatefulWidget {
  const GenderSelectionCard({
    super.key,
    this.initialGender = 'male',
    this.onGenderChanged,
  });

  final String initialGender;
  final ValueChanged<String>? onGenderChanged;

  @override
  State<GenderSelectionCard> createState() => _GenderSelectionCardState();
}

class _GenderSelectionCardState extends State<GenderSelectionCard> {
  late String _selectedGender;

  @override
  void initState() {
    super.initState();
    _selectedGender = widget.initialGender;
  }

  void _selectGender(String gender) {
    setState(() {
      _selectedGender = gender;
    });
    widget.onGenderChanged?.call(gender);
  }

  @override
  Widget build(BuildContext context) {
    final bool isMale = _selectedGender == 'male';

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
              context.tr(LocaleKeys.gender),
              textAlign: TextAlign.start,
              style: AppTextStyles.style13Bold(context),
            ),
          ),
          16.horizontalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.all(4.r),
              decoration: BoxDecoration(
                color: DynamicColors.background(context),
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectGender('female'),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        decoration: BoxDecoration(
                          color: !isMale ? AppColors.pink : Colors.transparent,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          context.tr(LocaleKeys.female),
                          textAlign: TextAlign.center,
                          style: AppTextStyles.style13Bold(
                            context,
                            color: !isMale ? Colors.white : context.textColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectGender('male'),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        decoration: BoxDecoration(
                          color: isMale ? AppColors.pink : Colors.transparent,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          context.tr(LocaleKeys.male),
                          textAlign: TextAlign.center,
                          style: AppTextStyles.style13Bold(
                            context,
                            color: isMale ? Colors.white : context.textColor,
                          ),
                        ),
                      ),
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
