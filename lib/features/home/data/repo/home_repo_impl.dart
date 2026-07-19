import 'package:zet/core/networking/api_client.dart';
import 'package:zet/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiClient apiClient;

  HomeRepoImpl(this.apiClient);
}
