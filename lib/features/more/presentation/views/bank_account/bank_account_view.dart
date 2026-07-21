import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/widgets/custom_app_bar.dart';
import 'package:zet/features/more/presentation/views/bank_account/widgets/bank_account_body.dart';

class BankAccountView extends StatelessWidget {
  const BankAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DynamicColors.background(context),
      appBar: CustomAppBar(
        title: context.tr(LocaleKeys.bankAccount),
      ),
      body: const BankAccountBody(),
    );
  }
}
