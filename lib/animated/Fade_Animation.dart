import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';


class FadeAnimation extends StatefulWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  _FadeAnimationState createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SequenceAnimation _sequenceAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
      animatable: Tween<double>(begin: 0.0, end: 1.0),
      from: Duration.zero,
      to: Duration(milliseconds: 500),
      tag: "opacity",
    )
        .addAnimatable(
      animatable: Tween<double>(begin: -30.0, end: 0.0),
      from: Duration.zero,
      to: Duration(milliseconds: 500),
      curve: Curves.easeOut,
      tag: "translateY",
    )
        .animate(_controller);
    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _sequenceAnimation["opacity"].value,
          child: Transform.translate(
            offset: Offset(0, _sequenceAnimation["translateY"].value),
            child: widget.child,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
