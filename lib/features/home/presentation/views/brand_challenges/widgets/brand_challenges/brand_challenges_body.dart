import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/features/home/data/models/brand_model.dart';
import 'package:zet/features/home/data/models/brand_enums.dart';
import 'package:zet/features/home/presentation/manager/home_cubit.dart';
import 'package:zet/features/home/presentation/manager/home_state.dart';
import 'package:zet/features/home/presentation/views/brand_challenges/widgets/brand_challenges/brand_challenges_grid_body.dart';
import 'package:zet/features/home/presentation/views/brand_challenges/widgets/brand_challenges/brand_challenges_list_body.dart';
import 'package:zet/features/home/presentation/views/brand_challenges/widgets/brand_view_mode_switcher.dart';

class BrandChallengesBody extends StatelessWidget {
  const BrandChallengesBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Static brand list utilizing translation
    final List<BrandModel> brands = List.generate(
      10,
      (index) => BrandModel(
        name: '${context.tr(LocaleKeys.companyName)} ${index + 1}',
        description: context.tr(LocaleKeys.companyDescription),
        detailedDescription: context.tr(LocaleKeys.companyDetailedDescription),
        logoAsset: AppImages.zetLogoDark,
        websiteUrl: 'https://google.com',
        instagramUrl: 'https://instagram.com',
        tiktokUrl: 'https://tiktok.com',
        downloadUrl: 'https://play.google.com',
      ),
    );

    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => previous.brandViewMode != current.brandViewMode,
      builder: (context, state) {
        return Column(
          children: [
            const BrandViewModeSwitcher(),
            Expanded(
              child: state.brandViewMode == BrandViewMode.list ? BrandChallengesListBody(brands: brands) : BrandChallengesGridBody(brands: brands),
            ),
          ],
        );
      },
    );
  }
}
