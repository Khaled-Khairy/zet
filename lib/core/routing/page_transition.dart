import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Available transition presets. Add new ones here + in
/// [RouteAnimations._getTransition].
enum TransitionType {
  slideFromBottom,
  slideFromTop,
  slideFromLeft,
  slideFromRight,
  fadeScale,
  zoom,
  fade,
  none,
}

/// Base contract every transition implements.
abstract class PageTransition {
  Widget buildTransition({
    required Animation<double> animation,
    required Animation<double> secondaryAnimation,
    required Widget child,
    required Curve curve,
  });
}

/// --- Slide transition (handles all 4 directions) ---
///
/// Horizontal slides (left/right) get a slight overshoot for a punchier
/// feel; vertical slides (top/bottom) stay linear-ish, which reads better
/// for sheet-like presentations.
class SlidePageTransition implements PageTransition {
  final AxisDirection direction;

  const SlidePageTransition({required this.direction});

  bool get _isHorizontal => direction == AxisDirection.left || direction == AxisDirection.right;

  Offset get _beginOffset {
    switch (direction) {
      case AxisDirection.right:
        return const Offset(1.0, 0.0);
      case AxisDirection.left:
        return const Offset(-1.0, 0.0);
      case AxisDirection.up:
        return const Offset(0.0, -1.0);
      case AxisDirection.down:
        return const Offset(0.0, 1.0);
    }
  }

  @override
  Widget buildTransition({
    required Animation<double> animation,
    required Animation<double> secondaryAnimation,
    required Widget child,
    Curve curve = Curves.easeInOutCubic,
  }) {
    final curved = CurvedAnimation(parent: animation, curve: curve);

    Animation<Offset> offsetAnimation;
    if (_isHorizontal) {
      final overshoot = _beginOffset.dx > 0 ? const Offset(0.05, 0.0) : const Offset(-0.05, 0.0);
      offsetAnimation = TweenSequence<Offset>([
        TweenSequenceItem(
          tween: Tween<Offset>(begin: _beginOffset, end: overshoot).chain(CurveTween(curve: Curves.easeOut)),
          weight: 80,
        ),
        TweenSequenceItem(
          tween: Tween<Offset>(begin: overshoot, end: Offset.zero).chain(CurveTween(curve: Curves.easeIn)),
          weight: 20,
        ),
      ]).animate(curved);
    } else {
      offsetAnimation = Tween<Offset>(begin: _beginOffset, end: Offset.zero).animate(curved);
    }

    // Outgoing page: fade out and drift slightly in the same direction,
    // so the transition doesn't look like the old page is frozen.
    final secondaryCurved = CurvedAnimation(parent: secondaryAnimation, curve: curve);
    final exitOffset = Tween<Offset>(
      begin: Offset.zero,
      end: _isHorizontal ? Offset(-_beginOffset.dx * 0.25, 0.0) : Offset(0.0, -_beginOffset.dy * 0.25),
    ).animate(secondaryCurved);

    return SlideTransition(
      position: exitOffset,
      child: FadeTransition(
        opacity: Tween<double>(begin: 1.0, end: 0.85).animate(secondaryCurved),
        child: SlideTransition(
          position: offsetAnimation,
          child: FadeTransition(opacity: curved, child: child),
        ),
      ),
    );
  }
}

/// --- Fade + scale transition ---
///
/// Covers both the old `FadeScaleTransition` (subtle, begin ~0.95) and
/// `ZoomTransition` (begin ~0.9) — they only ever differed by one number.
class FadeScalePageTransition implements PageTransition {
  final double beginScale;

  const FadeScalePageTransition({this.beginScale = 0.95});

  @override
  Widget buildTransition({
    required Animation<double> animation,
    required Animation<double> secondaryAnimation,
    required Widget child,
    Curve curve = Curves.easeInOutCubic,
  }) {
    final curved = CurvedAnimation(parent: animation, curve: curve);
    return FadeTransition(
      opacity: curved,
      child: ScaleTransition(
        scale: Tween<double>(begin: beginScale, end: 1.0).animate(curved),
        child: child,
      ),
    );
  }
}

/// --- Plain fade (no motion) ---
class FadePageTransition implements PageTransition {
  const FadePageTransition();

  @override
  Widget buildTransition({
    required Animation<double> animation,
    required Animation<double> secondaryAnimation,
    required Widget child,
    Curve curve = Curves.easeInOut,
  }) {
    return FadeTransition(
      opacity: CurvedAnimation(parent: animation, curve: curve),
      child: child,
    );
  }
}

/// --- Central place to build routes/pages from a [TransitionType] ---
class RouteAnimations {
  static const Duration defaultDuration = Duration(milliseconds: 350);
  static const Curve defaultCurve = Curves.easeInOutCubic;

  RouteAnimations._();

  /// For GoRouter: use inside `pageBuilder`.
  ///
  /// ```dart
  /// GoRoute(
  ///   path: '/details',
  ///   pageBuilder: (context, state) => RouteAnimations.buildPage(
  ///     context: context,
  ///     state: state,
  ///     child: const DetailsScreen(),
  ///     transitionType: TransitionType.slideFromRight,
  ///   ),
  /// )
  /// ```
  static Page<void> buildPage({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
    TransitionType transitionType = TransitionType.slideFromRight,
    Duration duration = defaultDuration,
    Curve curve = defaultCurve,
  }) {
    if (transitionType == TransitionType.none) {
      return NoTransitionPage(key: state.pageKey, child: child);
    }

    final transition = _getTransition(transitionType);

    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return transition.buildTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
          curve: curve,
        );
      },
    );
  }

  /// Legacy path: for `Navigator.push` / `onGenerateRoute` call sites that
  /// aren't on GoRouter (or during a gradual migration).
  static PageRouteBuilder<void> buildPageRoute({
    required Widget page,
    required RouteSettings settings,
    TransitionType transitionType = TransitionType.slideFromRight,
    Duration duration = defaultDuration,
    Curve curve = defaultCurve,
  }) {
    if (transitionType == TransitionType.none) {
      return PageRouteBuilder<void>(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      );
    }

    final transition = _getTransition(transitionType);

    return PageRouteBuilder<void>(
      settings: settings,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return transition.buildTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
          curve: curve,
        );
      },
    );
  }

  static PageTransition _getTransition(TransitionType type) {
    switch (type) {
      case TransitionType.slideFromBottom:
        return const SlidePageTransition(direction: AxisDirection.down);
      case TransitionType.slideFromTop:
        return const SlidePageTransition(direction: AxisDirection.up);
      case TransitionType.slideFromLeft:
        return const SlidePageTransition(direction: AxisDirection.left);
      case TransitionType.slideFromRight:
        return const SlidePageTransition(direction: AxisDirection.right);
      case TransitionType.fadeScale:
        return const FadeScalePageTransition(beginScale: 0.95);
      case TransitionType.zoom:
        return const FadeScalePageTransition(beginScale: 0.9);
      case TransitionType.fade:
        return const FadePageTransition();
      case TransitionType.none:
        throw ArgumentError('TransitionType.none is handled separately.');
    }
  }
}
