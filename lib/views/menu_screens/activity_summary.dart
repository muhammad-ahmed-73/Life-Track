import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:life_track/constants/color_constants.dart';
import 'package:life_track/constants/constants_widgets.dart';
import 'package:life_track/controllers/activitymenu_controller.dart';
import 'package:life_track/widgets/custom_header.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/image_controller.dart';
import '../../widgets/custom_Leaderboard.dart';
import '../../widgets/custom_bar_chart.dart';
import '../../widgets/custom_weightTrack_chart.dart';
import '../dashboard_screens/profile_screen.dart';

class ActivitySummary extends StatelessWidget {
  ActivitySummary({super.key});

  final ImageController imageController = Get.find<ImageController>();
  final ActivityMenuController activityController =
  Get.put(ActivityMenuController());  // <-- FIXED

  List<String> optionsList = ['All Time', 'This Week', 'This Month', 'Select Date'];
  final List<double> myValues = [30, 70, 20, 90, 60, 25, 40];
  final List<String> myDays = ["M", "T", "W", "T", "F", "S", "Today"];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageController.activitysummary,
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5.h),

              // ---------- HEADER ----------
              customHeader('Activity Summary'),
              SizedBox(height: 2.h),

              // ---------- SCROLLABLE CONTENT ----------
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Options row
                      SizedBox(
                        height: 3.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: optionsList.length,
                          itemBuilder: (context, index) {
                            return options(
                              optionsList[index],
                              isIcon: index == 3,
                              ontap: () => activityController.updateIsOptionSelected(index),
                              index: index,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 2.h),

                      // Last Activity Summary
                      blurContainer(
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(FontAwesomeIcons.heartPulse, color: Colors.white, size: 16.5.sp),
                                  SizedBox(width: 2.w),
                                  customText(
                                    text: 'Last Activity Summary',
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
                                        text: 'Distance',
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 15.5.sp,
                                      ),
                                      customText(
                                        text: '24.68 Km',
                                        color: Colors.white,
                                        fontSize: 16.5.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 7.w),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      customText(
                                        text: 'Time Spend',
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 15.5.sp,
                                      ),
                                      customText(
                                        text: '22Hr 36Mins',
                                        color: Colors.white,
                                        fontSize: 16.5.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 7.w),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      customText(
                                        text: 'Points Earned',
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 15.5.sp,
                                      ),
                                      customText(
                                        text: '400',
                                        color: Colors.white,
                                        fontSize: 16.5.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 0.8.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      customText(
                                        text: 'Avg Speed',
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 15.5.sp,
                                      ),
                                      customText(
                                        text: '24.68km',
                                        color: Colors.white,
                                        fontSize: 16.5.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              CustomBarChart(values: myValues, days: myDays, height: 19.h),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 1.5.h),

                      // Weight Line Chart
                      WeightLineChart(),
                      SizedBox(height: 3.h), // Optional bottom spacing
                      buildLeaderboard(),
                      SizedBox(height: 3.h), // Optional bottom spacing

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
Widget options(String title, {Icon? icon, bool? isIcon = false, VoidCallback? ontap, int? index}) {
  final ActivityMenuController activityController = Get.find();

  return Obx(() {
    final isSelected = activityController.isOptionSelected.value == index;

    return Container(
      margin: EdgeInsets.only(right: 1.5.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.sp),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: InkWell(
            onTap: ontap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.4.h),
              decoration: BoxDecoration(
                color: isSelected ? buttonColor : Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15.sp),
              ),
              child: isIcon == false
                  ? customText(
                text: title,
                color: isSelected ? Colors.white : Colors.white.withOpacity(.8),
                fontSize: 14.1.sp,
              )
                  : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  icon ??
                      Icon(Icons.calendar_today_outlined,
                          size: 15.sp,
                          color: Colors.white),
                  SizedBox(width: 2.w),
                  customText(
                    text: title,
                    color: isSelected ? Colors.white : Colors.white.withOpacity(.8),
                    fontSize: 14.1.sp,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  });
}
