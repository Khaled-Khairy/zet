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

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

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

    _slideAnimation = Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    // Use Timer so we can cancel on dispose
    _startTimer = Timer(widget.startDelay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _startTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
