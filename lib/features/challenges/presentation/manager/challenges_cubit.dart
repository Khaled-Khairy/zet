import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zet/features/challenges/data/repo/challenges_repo.dart';
import 'package:zet/features/challenges/presentation/manager/challenges_state.dart';

class ChallengesCubit extends Cubit<ChallengesState> {
  ChallengesCubit(this.challengesRepo) : super(const ChallengesState());
  final ChallengesRepo challengesRepo;
}
