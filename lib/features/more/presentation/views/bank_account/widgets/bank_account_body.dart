import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';

class BankAccountBody extends StatelessWidget {
  const BankAccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.tr(LocaleKeys.mainAccount),
                style: AppTextStyles.style14Bold(context),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: DynamicColors.sweetGrey(context),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 4.w,
                    children: [
                      Icon(
                        Iconsax.add_copy,
                        size: 20.r,
                        color: context.textColor,
                      ),
                      Text(
                        context.tr(LocaleKeys.addAccount),
                        style: AppTextStyles.style11Bold(context),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          16.verticalSpace,
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              color: DynamicColors.secondaryBackground(context),
              borderRadius: BorderRadius.circular(22.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10.h,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${context.tr(LocaleKeys.beneficiaryName)} : ',
                          style: AppTextStyles.style12Regular(
                            context,
                            color: context.textColor.withValues(alpha: 0.7),
                          ),
                        ),
                        Text(
                          'محمد احمد عبدالله',
                          style: AppTextStyles.style12Bold(context),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${context.tr(LocaleKeys.ibanNumber)} : ',
                          style: AppTextStyles.style12Regular(
                            context,
                            color: context.textColor.withValues(alpha: 0.7),
                          ),
                        ),
                        Text(
                          'SA123124235456000675',
                          style: AppTextStyles.style12Bold(context),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${context.tr(LocaleKeys.bank)} : ',
                          style: AppTextStyles.style12Regular(
                            context,
                            color: context.textColor.withValues(alpha: 0.7),
                          ),
                        ),
                        Text(
                          'بنك الراجحي',
                          style: AppTextStyles.style12Bold(context),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    AppSvgs.trash,
                    width: 20.w,
                    height: 20.h,
                    colorFilter: ColorFilter.mode(
                      context.textColor.withValues(alpha: 0.7),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
