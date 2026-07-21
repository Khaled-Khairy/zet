import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zet/core/cubit/app_cubit.dart';
import 'package:zet/core/networking/api_client.dart';
import 'package:zet/core/networking/api_services.dart';
import 'package:zet/core/networking/dio_factory.dart';
import 'package:zet/features/auth/data/repo/auth_repo.dart';
import 'package:zet/features/auth/data/repo/auth_repo_impl.dart';
import 'package:zet/features/auth/presentation/manager/auth_cubit.dart';
import 'package:zet/features/challenges/data/repo/challenges_repo.dart';
import 'package:zet/features/challenges/data/repo/challenges_repo_impl.dart';
import 'package:zet/features/challenges/presentation/manager/challenges_cubit.dart';
import 'package:zet/features/home/data/repo/home_repo.dart';
import 'package:zet/features/home/data/repo/home_repo_impl.dart';
import 'package:zet/features/home/presentation/manager/home_cubit.dart';
import 'package:zet/features/more/data/repo/more_repo.dart';
import 'package:zet/features/more/data/repo/more_repo_impl.dart';
import 'package:zet/features/more/presentation/manager/more_cubit.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // 1. Prefs first — everything else may depend on it
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // App Cubit
  getIt.registerLazySingleton<AppCubit>(() => AppCubit(getIt.get<SharedPreferences>()));

  // 2. Now it's safe for DioFactory to read tokens/config from prefs
  await DioFactory.initialize();
  getIt.registerSingleton<Dio>(DioFactory.dio);

  getIt.registerSingleton<ApiService>(ApiService(getIt.get<Dio>()));
  getIt.registerSingleton<ApiClient>(ApiClient(getIt.get<ApiService>()));

  // <================================= AUTH ==================================>
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(getIt.get<ApiClient>()));
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt.get<AuthRepo>()));

  // <================================= HOME ==================================>
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(getIt.get<ApiClient>()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt.get<HomeRepo>()));

  // <============================== CHALLENGES ===============================>
  getIt.registerLazySingleton<ChallengesRepo>(() => ChallengesRepoImpl(getIt.get<ApiClient>()));
  getIt.registerFactory<ChallengesCubit>(() => ChallengesCubit(getIt.get<ChallengesRepo>()));

  // <================================= MORE ==================================>
  getIt.registerLazySingleton<MoreRepo>(() => MoreRepoImpl(getIt.get<ApiClient>()));
  getIt.registerFactory<MoreCubit>(() => MoreCubit(getIt.get<MoreRepo>()));
}
