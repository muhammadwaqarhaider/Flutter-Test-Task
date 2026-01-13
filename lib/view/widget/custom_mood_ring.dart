import 'dart:math';

import 'package:flutter/material.dart';

class MoodRing extends StatelessWidget {
  final double size;
  final double strokeWidth;

  const MoodRing({Key? key, this.size = 300, this.strokeWidth = 20})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _RingPainter(strokeWidth),
    );
  }
}

class _RingPainter extends CustomPainter {
  final double strokeWidth;

  _RingPainter(this.strokeWidth);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - strokeWidth / 2;

    final gradient = SweepGradient(
      startAngle: 0,
      endAngle: 2 * pi,
      colors: const [
        Color(0xFFFC6B68),
        Color(0xFF53C7B1),
        Color(0xFFA18EFF),
        Color(0xFFFFA364),
        Color(0xFFFC6B68),
      ],
      stops: const [0, 0.25, 0.5, 0.75, 1],
      transform: GradientRotation(-pi / 2),
    );

    final rect = Rect.fromCircle(center: center, radius: radius);
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, paint);

    final innerPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius - strokeWidth / 2, innerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
