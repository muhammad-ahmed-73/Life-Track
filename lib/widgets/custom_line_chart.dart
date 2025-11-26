import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:life_track/constants/color_constants.dart';
import 'package:life_track/constants/constants_widgets.dart';
import 'package:sizer/sizer.dart';

import '../views/dashboard_screens/profile_screen.dart';

class CustomLineChart extends StatelessWidget {
  final List<double> bpmValues;
  final List<int> minutes;

  const CustomLineChart({
    super.key,
    required this.bpmValues,
    required this.minutes,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        blurContainer(
          ClipRRect(
            borderRadius: BorderRadius.circular(20), // circular edges
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.5.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText(
                            text: 'Pulse Count',
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                          ),
                          SizedBox(height: 0.2.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              customText(
                                text: '119',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 22.5.sp,
                                height: 01,
                              ),
                              SizedBox(width: 2.w),
                              customText(
                                text: 'BPM',
                                color: Colors.white.withValues(alpha: 0.6),
                                fontWeight: FontWeight.w400,
                                fontSize: 16.5.sp,
                                height: 0,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 16.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText(
                            text: 'Reward Earned',
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                          ),
                          SizedBox(height: 0.2.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              customText(
                                text: '80',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 22.5.sp,
                                height: 01,
                              ),
                              SizedBox(width: 2.w),
                              customText(
                                text: 'PAK',
                                color: Colors.white.withValues(alpha: 0.6),
                                fontWeight: FontWeight.w400,
                                fontSize: 16.5.sp,
                                height: 0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 2.5.h),
                  SizedBox(
                    height: 14.h, // adjust chart height
                    width: double.infinity,
                    child: CustomPaint(
                      painter: _PulseChartPainter(bpmValues, minutes),
                    ),
                  ),
                  SizedBox(height: 2.5.h),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 13.5.h,
            right: 4.w,
            child: Container(
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(8.sp)
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.2.h),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 13.sp,),
                    customText(
                      text: '10 PAK',
                      color: Colors.white,
                      fontSize: 12.sp
                    ),
                  ],
                ),
              ),
            )),
        Positioned(
            top: 9.9.h,
            right: 4.w,
            child: Container(
              decoration: BoxDecoration(
                  color: purpleColor,
                  borderRadius: BorderRadius.circular(8.sp)
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.6.w, vertical: 0.2.h),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.purpleAccent, size: 13.sp,),
                    customText(
                        text: '05 PAK',
                        color: Colors.black,
                        fontSize: 12.sp
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}

// CustomPainter
class _PulseChartPainter extends CustomPainter {
  final List<double> bpm;
  final List<int> minutes;

  _PulseChartPainter(this.bpm, this.minutes);

  @override
  void paint(Canvas canvas, Size size) {
    final chartHeight = size.height;
    final chartWidth = size.width;

    // --- Auto-scale min/max ---
    final minBpm = bpm.reduce((a, b) => a < b ? a : b);
    final maxBpm = bpm.reduce((a, b) => a > b ? a : b);
    final range = maxBpm - minBpm == 0 ? 1 : maxBpm - minBpm;

    // --- Smooth curve path ---
    final path = Path();
    for (int i = 0; i < bpm.length; i++) {
      final x = chartWidth * (i / (bpm.length - 1));
      final y = chartHeight * (1 - (bpm[i] - minBpm) / range);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        final prevX = chartWidth * ((i - 1) / (bpm.length - 1));
        final prevY = chartHeight * (1 - (bpm[i - 1] - minBpm) / range);
        final cx = (prevX + x) / 2;
        path.cubicTo(cx, prevY, cx, y, x, y);
      }
    }

    // --- Gradient fill under line ---
    final fillPath = Path.from(path)
      ..lineTo(chartWidth, chartHeight)
      ..lineTo(0, chartHeight)
      ..close();

    canvas.drawPath(
      fillPath,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue.withOpacity(0.7), Colors.blue.withOpacity(0.05)],
        ).createShader(Rect.fromLTWH(0, 0, chartWidth, chartHeight)),
    );

    // --- Draw line ---
    final linePaint = Paint()
      ..color = Colors.blueAccent
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawPath(path, linePaint);

    // --- Draw points ---
    final pointPaint = Paint()..color = Colors.blueAccent;
    for (int i = 0; i < bpm.length; i++) {
      final x = chartWidth * (i / (bpm.length - 1));
      final y = chartHeight * (1 - (bpm[i] - minBpm) / range);
      canvas.drawCircle(Offset(x, y), 6, pointPaint);
      canvas.drawCircle(Offset(x, y), 3, Paint()..color = Colors.white);
    }

    // --- Draw Y-axis labels and grid ---
    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    // Fixed Y-axis labels
    final List<int> yLabels = [60, 80, 100, 120, 140];
    for (int i = 0; i < yLabels.length; i++) {
      final yValue = yLabels[i].toInt();
      final y =
          chartHeight * (1 - (yValue - 60) / (140 - 60)); // scale from 60-140

      // Draw label
      textPainter.text = TextSpan(
        text: yValue.toString(),
        style: const TextStyle(color: Colors.white70, fontSize: 12),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(-textPainter.width - 4, y - textPainter.height / 2),
      );

      // Draw horizontal line except bottom
      if (i != 0) {
        final lineOffset = textPainter.height / 2;
        canvas.drawLine(
          Offset(0, y + lineOffset),
          Offset(chartWidth, y + lineOffset),
          Paint()
            ..color = Colors.white.withOpacity(0.15)
            ..strokeWidth = 1,
        );
      }
    }

    // --- Draw X-axis labels ---
    final List<String> xLabels = ['BP', '15', '30', '45', 'min'];
    for (int i = 0; i < xLabels.length; i++) {
      final x = chartWidth * (i / (xLabels.length - 1));
      final y = chartHeight + 4;
      textPainter.text = TextSpan(
        text: xLabels[i],
        style: const TextStyle(color: Colors.white70, fontSize: 12),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(x - textPainter.width / 2, y));
    }

    // --- Draw bottom X-axis line ---
    final axisPaint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..strokeWidth = 1;
    canvas.drawLine(
      Offset(0, chartHeight),
      Offset(chartWidth, chartHeight),
      axisPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
