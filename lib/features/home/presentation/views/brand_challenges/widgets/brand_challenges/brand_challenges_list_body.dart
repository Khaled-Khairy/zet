import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zet/core/routing/app_routes.dart';
import 'package:zet/features/home/data/models/brand_model.dart';
import 'package:zet/features/home/presentation/manager/home_cubit.dart';
import 'package:zet/features/more/presentation/views/favorite_stores/widgets/favorite_store_card.dart';

class BrandChallengesListBody extends StatelessWidget {
  final List<BrandModel> brands;

  const BrandChallengesListBody({
    super.key,
    required this.brands,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      itemCount: brands.length,
      separatorBuilder: (context, index) => 16.verticalSpace,
      itemBuilder: (context, index) {
        final brand = brands[index];
        return FavoriteStoreCard(
          model: FavoriteStoreModel(
            title: brand.name,
            description: brand.description,
          ),
          onTap: () {
            context.push(
              AppRoutes.brandDetails,
              extra: context.read<HomeCubit>(),
            );
          },
        );
      },
    );
  }
}
