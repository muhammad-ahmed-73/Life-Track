import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/color_constants.dart';

class ProgressCircle extends StatelessWidget {
  final double progress; // 0.0 to 1.0
  final String path;

  const ProgressCircle({super.key, required this.progress, required this.path});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 29.h,
      width: 29.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Custom Progress Ring + Pointer
          CustomPaint(
            size: Size(29.h, 29.h),
            painter: ProgressPainter(progress),
          ),

          // Circular Image
          Container(
            height: 22.h,
            width: 22.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(path),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressPainter extends CustomPainter {
  final double progress;

  ProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 8.0;

    final rect = Offset.zero & size;
    final center = size.center(Offset.zero);
    final radius = (size.width / 2);

    // Background circle
    final bgPaint = Paint()
      ..color = Colors.white.withOpacity(0.25)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, bgPaint);

    // Progress arc paint
    final fgPaint = Paint()
      ..color = buttonColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Start from bottom: 90° = pi/2
    final startAngle = pi / 2;
    final sweepAngle = 2 * pi * progress;

    // Draw progress arc
    canvas.drawArc(rect, startAngle, sweepAngle, false, fgPaint);

    // ---- Dual-layer Pointer ----
    final pointerAngle = startAngle + sweepAngle;
    final pointerRadius = radius;

    final dx = center.dx + pointerRadius * cos(pointerAngle);
    final dy = center.dy + pointerRadius * sin(pointerAngle);
    final pointerCenter = Offset(dx, dy);

    // Outer outline
    final outerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3; // thickness of outline

    // Inner filled circle
    final innerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final outerRadius = 6.0;       // outer circle radius
    final innerRadius = 2.0;        // inner circle radius (with padding)

    canvas.drawCircle(pointerCenter, outerRadius, outerPaint);
    canvas.drawCircle(pointerCenter, innerRadius, innerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

