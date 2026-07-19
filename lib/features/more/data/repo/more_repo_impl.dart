import 'package:zet/core/networking/api_client.dart';
import 'package:zet/features/more/data/repo/more_repo.dart';

class MoreRepoImpl implements MoreRepo {
  final ApiClient apiClient;

  MoreRepoImpl(this.apiClient);
}
