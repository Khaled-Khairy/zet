import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zet/features/more/data/repo/more_repo.dart';
import 'package:zet/features/more/presentation/manager/more_state.dart';

class MoreCubit extends Cubit<MoreState> {
  MoreCubit(this.moreRepo) : super(const MoreState());
  final MoreRepo moreRepo;
}
