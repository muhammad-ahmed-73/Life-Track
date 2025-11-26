import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:life_track/constants/color_constants.dart';
import 'package:life_track/constants/constants_widgets.dart';
import 'package:sizer/sizer.dart';

class CustomBarChart extends StatelessWidget {
  final List<double> values;
  final List<String> days;
  final double height;

  /// Constructor allows passing values, days, and optional height
  CustomBarChart({
    Key? key,
    required this.values,
    required this.days,
    this.height = 250, // default height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: BarChart(
        BarChartData(
          maxY: values.reduce((a, b) => a > b ? a : b) + 10, // max value + buffer
          barGroups: List.generate(values.length, (index) {
            return BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: values[index],
                  color: statusColor,
                  width: 8.5.w,
                  borderRadius: BorderRadius.circular(10.sp),
                  backDrawRodData: BackgroundBarChartRodData(
                    show: true,
                    toY: values.reduce((a, b) => a > b ? a : b) + 10,
                    color: Colors.transparent,
                  ),
                ),
              ],
            );
          }),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              //sideTitles: SideTitles(showTitles: true, reservedSize: 40),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  int index = value.toInt();
                  if (index < 0 || index >= days.length) return Container();
                  return Padding(
                    padding: EdgeInsets.only(top: 0.5.h),
                    child: customText(text: days[index], color: Colors.white, fontWeight: FontWeight.w600,fontSize:  15.sp),
                  );
                },
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }
}
