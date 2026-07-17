import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zet/features/auth/data/repo/auth_repo.dart';
import 'package:zet/features/auth/presentation/manager/auth_state.dart';


class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(const AuthState());
  final AuthRepo authRepo;
}
