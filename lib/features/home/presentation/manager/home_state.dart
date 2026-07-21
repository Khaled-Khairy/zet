import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zet/features/home/data/models/brand_enums.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(BrandViewMode.list) BrandViewMode brandViewMode,
    @Default(BrandDetailsTab.challenges) BrandDetailsTab brandDetailsTab,
    @Default(false) bool isSubscribed,
  }) = _HomeState;
}
