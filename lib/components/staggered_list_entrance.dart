import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Anima a entrada de itens de lista em cascata (de cima para baixo).
class AppStaggeredListEntrance extends StatefulWidget {
  const AppStaggeredListEntrance({
    super.key,
    required this.index,
    required this.child,
    this.enabled = true,
    this.interval = const Duration(milliseconds: 55),
    this.duration = const Duration(milliseconds: 320),
    this.maxAnimatedItems = 15,
  });

  final int index;
  final Widget child;
  final bool enabled;
  final Duration interval;
  final Duration duration;
  final int maxAnimatedItems;

  @override
  State<AppStaggeredListEntrance> createState() =>
      _AppStaggeredListEntranceState();
}

class _AppStaggeredListEntranceState extends State<AppStaggeredListEntrance>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slide;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startAnimation();
  }

  @override
  void didUpdateWidget(covariant AppStaggeredListEntrance oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.enabled != widget.enabled ||
        oldWidget.index != widget.index ||
        oldWidget.interval != widget.interval ||
        oldWidget.duration != widget.duration ||
        oldWidget.maxAnimatedItems != widget.maxAnimatedItems) {
      _controller.dispose();
      _setupAnimations();
      _startAnimation();
    }
  }

  void _setupAnimations() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    final curved = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, -0.14),
      end: Offset.zero,
    ).animate(curved);

    _fade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curved);
  }

  void _startAnimation() {
    if (!widget.enabled) {
      _controller.value = 1;
      return;
    }

    final cappedIndex = math.min(widget.index, widget.maxAnimatedItems);
    final delay = widget.interval * cappedIndex;

    if (delay == Duration.zero) {
      _controller.forward();
      return;
    }

    Future<void>.delayed(delay, () {
      if (mounted) {
        _controller.forward();
      }
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
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: widget.child,
      ),
    );
  }
}
