import 'dart:async';
import 'package:flutter/material.dart';

enum AppearDirection { fromBottom, fromTop, fromLeft, fromRight, none }

class AnimationWrapper extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final AppearDirection direction;
  final double offset;
  final Duration startDelay;

  const AnimationWrapper({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1200),
    this.curve = Curves.easeOutCubic,
    this.direction = AppearDirection.fromBottom,
    this.offset = 30.0,
    this.startDelay = const Duration(milliseconds: 400),
  });

  @override
  State<AnimationWrapper> createState() => _AnimationWrapperState();
}

class _AnimationWrapperState extends State<AnimationWrapper> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;

  Timer? _startTimer;
  ScrollPosition? _scrollPosition;
  bool _animationStarted = false;
  // Safe fallback until build() sets this from MediaQuery
  double _screenHeight = 800.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: widget.curve),
    );
    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: widget.curve),
    );

    Offset beginOffset;
    switch (widget.direction) {
      case AppearDirection.fromBottom:
        beginOffset = Offset(0, widget.offset / 100);
        break;
      case AppearDirection.fromTop:
        beginOffset = Offset(0, -widget.offset / 100);
        break;
      case AppearDirection.fromLeft:
        beginOffset = Offset(-widget.offset / 100, 0);
        break;
      case AppearDirection.fromRight:
        beginOffset = Offset(widget.offset / 100, 0);
        break;
      case AppearDirection.none:
        beginOffset = Offset.zero;
        break;
    }

    _slideAnimation = Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: widget.curve),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Walk ALL ancestors to find the outermost vertical scrollable.
    // This handles items inside nested non-scrollable lists (e.g. shrinkWrap
    // ListView) and items inside horizontal lists, both of which previously
    // caused Scrollable.maybeOf to return the wrong scrollable.
    _detachScrollListener();
    context.visitAncestorElements((element) {
      if (element.widget is Scrollable) {
        final state = (element as StatefulElement).state;
        if (state is ScrollableState && state.widget.axis == Axis.vertical) {
          try {
            _scrollPosition = state.position;
          } catch (_) {}
          // Continue walking to find an even further-out vertical scrollable
        }
      }
      return true;
    });
    _scrollPosition?.addListener(_onScroll);

    // Schedule a visibility check for the very first frame
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkAndAnimate());
  }

  void _detachScrollListener() {
    _scrollPosition?.removeListener(_onScroll);
    _scrollPosition = null;
  }

  void _onScroll() {
    if (!_animationStarted) _checkAndAnimate();
  }

  void _checkAndAnimate() {
    if (!mounted || _animationStarted) return;

    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null || !renderBox.hasSize) return;

    try {
      final topLeft = renderBox.localToGlobal(Offset.zero);
      final bottomEdge = topLeft.dy + renderBox.size.height;
      final isVisible = bottomEdge > 0 && topLeft.dy < _screenHeight;

      if (isVisible) {
        _animationStarted = true;
        _detachScrollListener();
        _startTimer = Timer(widget.startDelay, () {
          if (mounted) _controller.forward();
        });
      }
    } catch (_) {}
  }

  @override
  void dispose() {
    _detachScrollListener();
    _startTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Capture screen height here — the only safe place to call MediaQuery
    _screenHeight = MediaQuery.sizeOf(context).height;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: widget.child,
        ),
      ),
    );
  }
}
