import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/styles.dart';
import 'package:zet/core/widgets/app_button.dart';
import 'package:zet/core/widgets/app_text_field.dart';
import 'package:zet/features/more/presentation/views/request_transfer/widgets/bank_account_info_card.dart';
import 'package:zet/features/more/presentation/views/request_transfer/widgets/wallet_balance_card.dart';

class RequestTransferBody extends StatelessWidget {
  const RequestTransferBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight - 40.h,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const WalletBalanceCard(balance: '225'),
                  24.verticalSpace,
                  AppTextField(
                    title: context.tr(LocaleKeys.enterAmountManually),
                    titleStyle: AppTextStyles.style13Bold(context),
                    hint: context.tr(LocaleKeys.writeHere),
                    keyboardType: TextInputType.number,
                    suffixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            context.tr(LocaleKeys.riyals),
                            style: AppTextStyles.style14Bold(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                  24.verticalSpace,
                  const BankAccountInfoCard(),
                  const Spacer(),
                  24.verticalSpace,
                  Center(
                    child: AppButton(
                      onPressed: () {},
                    ),
                  ),
                  10.verticalSpace,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
