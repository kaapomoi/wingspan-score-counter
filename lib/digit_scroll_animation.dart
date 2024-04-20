import 'package:flutter/material.dart';

class DigitScrollAnimation extends StatefulWidget {
  final int value;
  final Duration duration;

  const DigitScrollAnimation(
      {super.key, required this.value, required this.duration});

  @override
  State<DigitScrollAnimation> createState() => _DigitScrollAnimationState();
}

class _DigitScrollAnimationState extends State<DigitScrollAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = IntTween(
      begin: 0,
      end: widget.value,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutQuint));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final fontSize = 24.0 + (_animation.value / 3.0);

        return Text(
          _animation.value.toString(),
          style: TextStyle(fontSize: fontSize, color: Colors.yellowAccent),
        );
      },
    );
  }
}
