import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/core/widgets/custom_app_bar.dart';
import 'package:zet/features/more/presentation/views/challenge_history/widgets/challenge_history_body.dart';

class ChallengeHistoryView extends StatelessWidget {
  const ChallengeHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DynamicColors.background(context),
      appBar: CustomAppBar(
        title: context.tr(LocaleKeys.challengeHistory),
      ),
      body: const ChallengeHistoryBody(),
    );
  }
}
