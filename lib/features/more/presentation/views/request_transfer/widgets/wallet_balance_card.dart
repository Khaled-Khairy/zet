import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/styles.dart';

class WalletBalanceCard extends StatelessWidget {
  const WalletBalanceCard({
    super.key,
    this.balance = '225',
  });

  final String balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: const Color(0xFF292929),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${context.tr(LocaleKeys.walletBalance)} :',
            style: AppTextStyles.style14Bold(context, color: Colors.white),
          ),
          Text(
            '$balance ${context.tr(LocaleKeys.riyals)}',
            style: AppTextStyles.style14Bold(context, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
