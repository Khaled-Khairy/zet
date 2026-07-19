import 'package:freezed_annotation/freezed_annotation.dart';

part 'more_state.freezed.dart';

@freezed
abstract class MoreState with _$MoreState {
  const factory MoreState() = _MoreState;
}
