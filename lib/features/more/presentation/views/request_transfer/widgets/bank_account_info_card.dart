import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class BankAccountInfoCard extends StatelessWidget {
  const BankAccountInfoCard({
    super.key,
    this.beneficiaryName = 'محمد احمد عبدالله',
    this.ibanNumber = 'SA123124235456000675',
    this.bankName = 'بنك الراجحي',
  });

  final String beneficiaryName;
  final String ibanNumber;
  final String bankName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Text(
            '${context.tr(LocaleKeys.chooseBankAccount)} :',
            style: AppTextStyles.style13Bold(context),
          ),
        ),
        10.verticalSpace,
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            color: DynamicColors.secondaryBackground(context),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10.h,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${context.tr(LocaleKeys.beneficiaryName)} : ',
                    style: AppTextStyles.style13Regular(
                      context,
                      color: context.textColor.withValues(alpha: 0.7),
                    ),
                  ),
                  Text(
                    beneficiaryName,
                    style: AppTextStyles.style13Bold(context),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${context.tr(LocaleKeys.ibanNumber)} : ',
                    style: AppTextStyles.style13Regular(
                      context,
                      color: context.textColor.withValues(alpha: 0.7),
                    ),
                  ),
                  Text(
                    ibanNumber,
                    style: AppTextStyles.style13Bold(context),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${context.tr(LocaleKeys.bank)} : ',
                    style: AppTextStyles.style13Regular(
                      context,
                      color: context.textColor.withValues(alpha: 0.7),
                    ),
                  ),
                  Text(
                    bankName,
                    style: AppTextStyles.style13Bold(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
