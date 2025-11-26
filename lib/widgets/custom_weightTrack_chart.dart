import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_track/constants/color_constants.dart';
import 'package:life_track/views/dashboard_screens/profile_screen.dart';
import 'package:sizer/sizer.dart';

import '../constants/constants_widgets.dart';

Widget WeightLineChart() {
  return blurContainer(
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/icons/weight_track_icon.png',
                width: 4.w,
              ),
              SizedBox(width: 2.w),
              customText(
                text: 'Weight Tracking',
                color: Colors.white,
                fontSize: 16.5.sp,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          SizedBox(height: 1.5.h),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(
                    text: 'Statistics',
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 15.5.sp,
                  ),
                  Row(
                    children: [
                      customText(
                        text: 'July 08,2025',
                        color: Colors.white,
                        fontSize: 16.5.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(width: 15.w),
                      customText(
                        text: 'All',
                        color: Colors.white.withValues(alpha: 0.5),
                        fontSize: 16.5.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(width: 2.w),
                      customText(
                        text: 'Weekly',
                        color: Colors.white,
                        fontSize: 16.5.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(width: 2.w),
                      customText(
                        text: 'Monthly',
                        color: Colors.white.withValues(alpha: 0.5),
                        fontSize: 16.5.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 2.h),
          SizedBox(
            height: 22.h,
            width: double.infinity,
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: 6,
                minY: 170,
                maxY: 186,

                // ---------------- GRID ----------------
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.white.withOpacity(0.20),
                      strokeWidth: 1,
                    );
                  },
                  checkToShowHorizontalLine: (value) {
                    return value == 170 ||
                        value == 175 ||
                        value == 180 ||
                        value == 185;
                  },
                ),

                borderData: FlBorderData(show: false),

                // ---------------- TITLES ----------------
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 5,
                      getTitlesWidget: (value, meta) {
                        if (value == 170 ||
                            value == 175 ||
                            value == 180 ||
                            value == 185) {
                          return customText(
                            text: "${value.toInt()} lbs",
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 13.sp,
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (value == 0) {
                          return Padding(
                            padding: EdgeInsets.only(top: 1.h, left: 8.w),
                            child: customText(
                              text: "July 01",
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 13.sp,
                            ),
                          );
                        }
                        if (value == 6) {
                          return Padding(
                            padding: EdgeInsets.only(top: 1.h, right: 5.w),
                            child: customText(
                              text: "July 07",
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 13.sp,
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),

                // ---------------- EXTRA LINES ----------------
                extraLinesData: ExtraLinesData(
                  horizontalLines: [
                    // Green baseline (minY)
                    HorizontalLine(
                      y: 170,
                      color: buttonColor,
                      strokeWidth: 2.5,
                    ),
                    // Red line at first point
                    HorizontalLine(
                      y: 185,
                      color: Colors.red,
                      strokeWidth: 2.5,
                    ),
                    // Orange line at last point
                    HorizontalLine(
                      y: 178,
                      color: Colors.orange,
                      strokeWidth: 2.5,
                    ),
                  ],
                ),

                // ---------------- LINE CHART DATA ----------------
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 185),
                      FlSpot(1, 183),
                      FlSpot(2, 182),
                      FlSpot(3, 178),
                      FlSpot(4, 181),
                      FlSpot(5, 179),
                      FlSpot(6, 178),
                    ],
                    isCurved: true,
                    barWidth: 3.5,
                    color: Colors.blueAccent,
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          Colors.blueAccent.withOpacity(0.5),
                          Colors.blueAccent.withOpacity(0.05),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, bar, index) {
                        return FlDotCirclePainter(
                          radius: index == 6 ? 5 : 3,
                          color: Colors.white,
                          strokeColor: Colors.orange,
                          strokeWidth: index == 6 ? 2 : 1.5,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 2.h,),
          Divider(),
          SizedBox(height: 1.h,),

          Row(
            children: [
              customColorContainer(Colors.red, 'Starting Weight'),
              SizedBox(width: 8.w,),
              customColorContainer(Colors.orange, 'Current Weight'),
            ],
          ),
          SizedBox(height: 0.6.h,),
          customColorContainer(buttonColor, 'Desired Weight'),

        ],
      ),
    ),
  );
}
Widget customColorContainer(Color color, String text){
  return Row(
    children: [
      Container(
        height: 1.25.h,
        width: 8.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.sp),
          color: color
        ),
      ),
      SizedBox(width: 3.w,),
      customText(
        text: text,
        color: Colors.white,
        fontWeight: FontWeight.w600
      )
    ],
  );
}
