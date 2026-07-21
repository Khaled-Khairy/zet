import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/features/more/presentation/views/favorite_stores/widgets/favorite_store_card.dart';

class FavoriteStoresBody extends StatelessWidget {
  const FavoriteStoresBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      itemCount: 3,
      separatorBuilder: (context, index) => 16.verticalSpace,
      itemBuilder: (context, index) {
        return FavoriteStoreCard(
          model: FavoriteStoreModel(
            title: context.tr(LocaleKeys.companyName),
            description: context.tr(LocaleKeys.companyDescription),
          ),
          onTap: () {},
        );
      },
    );
  }
}
