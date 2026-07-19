import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zet/core/di/service_locator.dart';
import 'package:zet/features/more/presentation/manager/more_cubit.dart';
import 'package:zet/features/more/presentation/views/widgets/more_body.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MoreCubit>(),
      child: const Scaffold(
        body: MoreBody(),
      ),
    );
  }
}
