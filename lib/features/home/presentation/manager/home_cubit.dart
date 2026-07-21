import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zet/features/home/data/models/brand_enums.dart';
import 'package:zet/features/home/data/repo/home_repo.dart';
import 'package:zet/features/home/presentation/manager/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(const HomeState());
  final HomeRepo homeRepo;

  void toggleBrandViewMode() {
    final nextMode = state.brandViewMode == BrandViewMode.list
        ? BrandViewMode.grid
        : BrandViewMode.list;
    emit(state.copyWith(brandViewMode: nextMode));
  }

  void selectBrandDetailsTab(BrandDetailsTab tab) {
    emit(state.copyWith(brandDetailsTab: tab));
  }

  void toggleSubscribe() {
    emit(state.copyWith(isSubscribed: !state.isSubscribed));
  }
}
