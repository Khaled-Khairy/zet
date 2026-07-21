import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zet/core/routing/app_routes.dart';
import 'package:zet/core/routing/page_transition.dart';
import 'package:zet/features/auth/presentation/views/login_view.dart';
import 'package:zet/features/auth/presentation/views/otp_view.dart';
import 'package:zet/features/auth/presentation/views/sign_in_view.dart';
import 'package:zet/features/auth/presentation/views/welcome_page_view.dart';
import 'package:zet/features/challenges/presentation/views/challenges_view.dart';
import 'package:zet/features/home/presentation/views/category_challenges/category_challenges_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zet/features/home/presentation/views/home/home_view.dart';
import 'package:zet/features/home/presentation/views/brand_challenges/brand_challenges_view.dart';
import 'package:zet/features/home/presentation/views/brand_challenges/brand_details_view.dart';
import 'package:zet/features/home/presentation/manager/home_cubit.dart';
import 'package:zet/features/more/presentation/views/challenge_history/challenge_history_view.dart';
import 'package:zet/features/more/presentation/views/bank_account/bank_account_view.dart';
import 'package:zet/features/more/presentation/views/contact_us/contact_us_view.dart';
import 'package:zet/features/more/presentation/views/favorite_stores/favorite_stores_view.dart';
import 'package:zet/features/more/presentation/views/manage_personal_account/manage_personal_account_view.dart';
import 'package:zet/features/more/presentation/views/more/more_view.dart';
import 'package:zet/features/more/presentation/views/notifications/notifications_view.dart';
import 'package:zet/features/more/presentation/views/premium_package/premium_package_view.dart';
import 'package:zet/features/more/presentation/views/request_transfer/request_transfer_view.dart';
import 'package:zet/features/more/presentation/views/settings/settings_view.dart';
import 'package:zet/features/splash/view/splash_view.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,

    // ---------------------------------------------------------------
    // ERROR PAGE (invalid/unknown route)
    // ---------------------------------------------------------------
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Page not found')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 64),
            const SizedBox(height: 16),
            Text('No route for "${state.uri}"'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go(AppRoutes.home),
              child: const Text('Go home'),
            ),
          ],
        ),
      ),
    ),

    // ---------------------------------------------------------------
    // ROUTES
    // ---------------------------------------------------------------
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        pageBuilder: (context, state) => RouteAnimations.buildPage(
          context: context,
          state: state,
          child: const SplashView(),
          transitionType: TransitionType.slideFromRight,
        ),
      ),
      GoRoute(
        path: AppRoutes.welcomePage,
        pageBuilder: (context, state) => RouteAnimations.buildPage(
          context: context,
          state: state,
          child: const WelcomePageView(),
          transitionType: TransitionType.slideFromBottom,
        ),
      ),
      GoRoute(
        path: AppRoutes.login,
        pageBuilder: (context, state) => RouteAnimations.buildPage(
          context: context,
          state: state,
          child: const LoginView(),
          transitionType: TransitionType.slideFromBottom,
        ),
      ),
      GoRoute(
        path: AppRoutes.signIn,
        pageBuilder: (context, state) => RouteAnimations.buildPage(
          context: context,
          state: state,
          child: const SignInView(),
          transitionType: TransitionType.slideFromBottom,
        ),
      ),
      GoRoute(
        path: AppRoutes.otp,
        pageBuilder: (context, state) => RouteAnimations.buildPage(
          context: context,
          state: state,
          child: const OtpView(),
          transitionType: TransitionType.slideFromBottom,
        ),
      ),
      GoRoute(
        path: AppRoutes.home,
        pageBuilder: (context, state) => RouteAnimations.buildPage(
          context: context,
          state: state,
          child: const HomeView(),
          transitionType: TransitionType.fade,
        ),
      ),
      GoRoute(
        path: AppRoutes.challenges,
        pageBuilder: (context, state) => RouteAnimations.buildPage(
          context: context,
          state: state,
          child: const ChallengesView(),
          transitionType: TransitionType.fade,
        ),
      ),
      GoRoute(
        path: AppRoutes.more,
        pageBuilder: (context, state) => RouteAnimations.buildPage(
          context: context,
          state: state,
          child: const MoreView(),
          transitionType: TransitionType.fade,
        ),
      ),
      GoRoute(
        path: AppRoutes.settings,
        pageBuilder: (context, state) => RouteAnimations.buildPage(
          context: context,
          state: state,
          child: const SettingsView(),
          transitionType: TransitionType.slideFromRight,
        ),
      ),
      GoRoute(
        path: AppRoutes.notifications,
        pageBuilder: (context, state) => RouteAnimations.buildPage(
          context: context,
          state: state,
          child: const NotificationsView(),
          transitionType: TransitionType.slideFromRight,
        ),
      ),
      GoRoute(
        path: AppRoutes.categoryChallenges,
        pageBuilder: (context, state) {
          final String title = state.extra as String? ?? '';
          return RouteAnimations.buildPage(
            context: context,
            state: state,
            child: CategoryChallengesView(title: title),
            transitionType: TransitionType.slideFromRight,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.contactUs,
        pageBuilder: (context, state) => RouteAnimations.buildPage(
          context: context,
          state: state,
          child: const ContactUsView(),
          transitionType: TransitionType.slideFromRight,
        ),
      ),
      GoRoute(
        path: AppRoutes.challengeHistory,
        pageBuilder: (context, state) => RouteAnimations.buildPage(
          context: context,
          state: state,
          child: const ChallengeHistoryView(),
          transitionType: TransitionType.slideFromRight,
        ),
      ),
      GoRoute(
        path: AppRoutes.requestTransfer,
        pageBuilder: (context, state) => RouteAnimations.buildPage(
          context: context,
          state: state,
          child: const RequestTransferView(),
          transitionType: TransitionType.slideFromRight,
        ),
      ),
      GoRoute(
        path: AppRoutes.favoriteStores,
        pageBuilder: (context, state) => RouteAnimations.buildPage(
          context: context,
          state: state,
          child: const FavoriteStoresView(),
          transitionType: TransitionType.slideFromRight,
        ),
      ),
      GoRoute(
        path: AppRoutes.managePersonalAccount,
        pageBuilder: (context, state) => RouteAnimations.buildPage(
          context: context,
          state: state,
          child: const ManagePersonalAccountView(),
          transitionType: TransitionType.slideFromRight,
        ),
      ),
      GoRoute(
        path: AppRoutes.bankAccount,
        pageBuilder: (context, state) => RouteAnimations.buildPage(
          context: context,
          state: state,
          child: const BankAccountView(),
          transitionType: TransitionType.slideFromRight,
        ),
      ),
      GoRoute(
        path: AppRoutes.premiumPackage,
        pageBuilder: (context, state) => RouteAnimations.buildPage(
          context: context,
          state: state,
          child: const PremiumPackageView(),
          transitionType: TransitionType.slideFromRight,
        ),
      ),
      GoRoute(
        path: AppRoutes.brandChallenges,
        pageBuilder: (context, state) {
          final homeCubit = state.extra as HomeCubit;
          return RouteAnimations.buildPage(
            context: context,
            state: state,
            child: BlocProvider.value(
              value: homeCubit,
              child: const BrandChallengesView(),
            ),
            transitionType: TransitionType.slideFromRight,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.brandDetails,
        pageBuilder: (context, state) {
          final homeCubit = state.extra as HomeCubit;
          return RouteAnimations.buildPage(
            context: context,
            state: state,
            child: BlocProvider.value(
              value: homeCubit,
              child: const BrandDetailsView(),
            ),
            transitionType: TransitionType.slideFromRight,
          );
        },
      ),
    ],
  );
}
