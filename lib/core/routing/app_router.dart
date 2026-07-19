import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zet/core/routing/app_routes.dart';
import 'package:zet/core/routing/page_transition.dart';
import 'package:zet/features/auth/presentation/views/login_view.dart';
import 'package:zet/features/auth/presentation/views/otp_view.dart';
import 'package:zet/features/auth/presentation/views/sign_in_view.dart';
import 'package:zet/features/auth/presentation/views/welcome_page_view.dart';
import 'package:zet/features/challenges/presentation/views/challenges_view.dart';
import 'package:zet/features/home/presentation/views/home_view.dart';
import 'package:zet/features/more/presentation/views/more_view.dart';
import 'package:zet/features/splash/view/splash_view.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,

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
          transitionType: TransitionType.slideFromRight,
        ),
      ),
      GoRoute(
        path: AppRoutes.challenges,
        pageBuilder: (context, state) => RouteAnimations.buildPage(
          context: context,
          state: state,
          child: const ChallengesView(),
          transitionType: TransitionType.slideFromRight,
        ),
      ),
      GoRoute(
        path: AppRoutes.more,
        pageBuilder: (context, state) => RouteAnimations.buildPage(
          context: context,
          state: state,
          child: const MoreView(),
          transitionType: TransitionType.slideFromRight,
        ),
      ),
    ],
  );
}
