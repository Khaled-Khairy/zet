import 'package:zet/core/networking/api_client.dart';
import 'package:zet/features/challenges/data/repo/challenges_repo.dart';

class ChallengesRepoImpl implements ChallengesRepo {
  final ApiClient apiClient;

  ChallengesRepoImpl(this.apiClient);
}
