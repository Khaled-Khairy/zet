import 'package:flutter/material.dart';

class BouncingTapWrapper extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double scaleFactor;
  final Duration duration;

  const BouncingTapWrapper({
    super.key,
    required this.child,
    this.onTap,
    this.scaleFactor = 0.94,
    this.duration = const Duration(milliseconds: 90),
  });

  @override
  State<BouncingTapWrapper> createState() => _BouncingTapWrapperState();
}

class _BouncingTapWrapperState extends State<BouncingTapWrapper> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: widget.scaleFactor,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (widget.onTap == null || _isAnimating) return;

    _isAnimating = true;
    _controller.forward().then((_) {
      _controller.reverse().then((_) {
        _isAnimating = false;
        widget.onTap?.call();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap != null ? _handleTap : null,
      behavior: HitTestBehavior.opaque,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: widget.child,
      ),
    );
  }
}
