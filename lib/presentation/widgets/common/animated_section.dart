import 'package:flutter/material.dart';

class AnimatedSection extends StatefulWidget {
  const AnimatedSection({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.direction = AxisDirection.up,
    this.offset = 60,
  });

  final Widget child;
  final Duration delay;
  final AxisDirection direction;
  final double offset;

  @override
  State<AnimatedSection> createState() => _AnimatedSectionState();
}

class _AnimatedSectionState extends State<AnimatedSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacityAnimation;
  late final Animation<Offset> _positionAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    final offsetFraction = widget.offset / 120;
    final beginOffset = _directionToOffset(widget.direction, offsetFraction);
    _positionAnimation = Tween<Offset>(
      begin: beginOffset,
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
    _opacityAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: SlideTransition(
        position: _positionAnimation,
        child: widget.child,
      ),
    );
  }

  Offset _directionToOffset(AxisDirection direction, double delta) {
    switch (direction) {
      case AxisDirection.up:
        return Offset(0, delta);
      case AxisDirection.down:
        return Offset(0, -delta);
      case AxisDirection.right:
        return Offset(-delta, 0);
      case AxisDirection.left:
        return Offset(delta, 0);
    }
  }
}
