import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';
import 'package:zet/features/more/presentation/views/premium_package/widgets/premium_features_card.dart';

class PremiumPackageBody extends StatelessWidget {
  const PremiumPackageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        children: [
          const PremiumFeaturesCard(),
          const Spacer(),
          Center(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 250.w,
                height: 54.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.cyan,
                  borderRadius: BorderRadius.circular(40.r),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 15,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Text(
                  context.tr(LocaleKeys.activatePremiumPackage),
                  style: AppTextStyles.style16Bold(
                    context,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          30.verticalSpace,
        ],
      ),
    );
  }
}
