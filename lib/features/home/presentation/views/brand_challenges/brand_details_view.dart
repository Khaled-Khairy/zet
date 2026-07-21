import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/widgets/custom_app_bar.dart';
import 'package:zet/features/home/presentation/views/brand_challenges/widgets/brand_details/brand_details_body.dart';

class BrandDetailsView extends StatelessWidget {
  const BrandDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DynamicColors.background(context),
      appBar: CustomAppBar(
        title: context.tr(LocaleKeys.back),
      ),
      body: const BrandDetailsBody(),
    );
  }
}
