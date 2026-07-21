import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zet/core/di/service_locator.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/resources/styles.dart';
import 'package:zet/features/challenges/presentation/manager/challenges_cubit.dart';
import 'package:zet/features/challenges/presentation/views/widgets/challenges_body.dart';

class ChallengesView extends StatelessWidget {
  const ChallengesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<ChallengesCubit>(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: DynamicColors.secondaryBackground(context),
          title: Text(
            context.tr(LocaleKeys.challengePage),
            style: AppTextStyles.style15Bold(context),
          ),
        ),
        body: const ChallengesBody(),
      ),
    );
  }
}
