import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zet/features/challenges/data/models/challenge_filter.dart';

part 'challenges_state.freezed.dart';

@freezed
abstract class ChallengesState with _$ChallengesState {
  const factory ChallengesState({
    @Default(ChallengeFilter.current) ChallengeFilter filter,
  }) = _ChallengesState;
}
