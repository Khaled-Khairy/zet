import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zet/features/challenges/data/repo/challenges_repo.dart';
import 'package:zet/features/challenges/data/models/challenge_filter.dart';
import 'package:zet/features/challenges/presentation/manager/challenges_state.dart';

class ChallengesCubit extends Cubit<ChallengesState> {
  ChallengesCubit(this.challengesRepo) : super(const ChallengesState());

  final ChallengesRepo challengesRepo;

  /// Toggle the given filter.
  /// If it's already selected → deselect (none).
  /// If it's not selected → select it.
  void toggleFilter(ChallengeFilter filter) {
    final newFilter = state.filter == filter ? ChallengeFilter.none : filter;
    emit(state.copyWith(filter: newFilter));
  }
}
