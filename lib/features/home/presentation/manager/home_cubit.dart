import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zet/features/home/data/repo/home_repo.dart';
import 'package:zet/features/home/presentation/manager/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(const HomeState());
  final HomeRepo homeRepo;
}
