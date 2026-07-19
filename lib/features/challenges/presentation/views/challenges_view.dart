import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zet/core/di/service_locator.dart';
import 'package:zet/features/challenges/presentation/manager/challenges_cubit.dart';
import 'package:zet/features/challenges/presentation/views/widgets/challenges_body.dart';

class ChallengesView extends StatelessWidget {
  const ChallengesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ChallengesCubit>(),
      child: const Scaffold(
        body: ChallengesBody(),
      ),
    );
  }
}
