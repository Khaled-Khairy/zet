import 'package:zet/core/networking/api_client.dart';
import 'package:zet/features/auth/data/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiClient apiClient;

  AuthRepoImpl(this.apiClient);
}
