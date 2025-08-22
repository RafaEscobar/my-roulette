import 'dart:ui';
import 'package:flutter/material.dart';

class PingText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration duration;
  final double beginScale;
  final double endScale;
  final int pulses;
  final bool showBaseText;

  const PingText({
    super.key,
    required this.text,
    this.style,
    this.duration = const Duration(milliseconds: 1200),
    this.beginScale = 1.0,
    this.endScale = 2.2,
    this.pulses = 2,
    this.showBaseText = true,
  });

  @override
  State<PingText> createState() => _PingTextState();
}

class _PingTextState extends State<PingText> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _pulseA;
  late final Animation<double> _pulseB;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();

    _pulseA = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
    );

    _pulseB = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildPulse(Animation<double> anim) {
    return AnimatedBuilder(
      animation: anim,
      builder: (_, __) {
        final t = anim.value;
        final scale = lerpDouble(widget.beginScale, widget.endScale, t) ?? 1.0;
        final opacity = (1.0 - t).clamp(0.0, 1.0);
        return Transform.scale(
          scale: scale,
          child: Opacity(
            opacity: opacity,
            child: Text(
              widget.text,
              style: widget.style,
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (widget.showBaseText)
          Text(
            widget.text,
            style: widget.style,
            textAlign: TextAlign.center,
          ),
        _buildPulse(_pulseA),
        if (widget.pulses > 1) _buildPulse(_pulseB),
      ],
    );
  }
}
