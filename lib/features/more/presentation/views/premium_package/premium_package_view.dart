import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/widgets/custom_app_bar.dart';
import 'package:zet/features/more/presentation/views/premium_package/widgets/premium_package_body.dart';

class PremiumPackageView extends StatelessWidget {
  const PremiumPackageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DynamicColors.background(context),
      appBar: CustomAppBar(
        title: context.tr(LocaleKeys.premiumPackage),
      ),
      body: const PremiumPackageBody(),
    );
  }
}
