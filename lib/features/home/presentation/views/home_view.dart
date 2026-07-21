import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zet/core/di/service_locator.dart';
import 'package:zet/features/home/presentation/manager/home_cubit.dart';
import 'package:zet/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:zet/features/home/presentation/views/widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<HomeCubit>(),
      child: const Scaffold(
        appBar: HomeAppBar(),
        body: HomeBody(),
      ),
    );
  }
}
