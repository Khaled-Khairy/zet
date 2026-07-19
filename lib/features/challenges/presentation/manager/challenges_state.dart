import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenges_state.freezed.dart';

@freezed
abstract class ChallengesState with _$ChallengesState {
  const factory ChallengesState() = _ChallengesState;
}
