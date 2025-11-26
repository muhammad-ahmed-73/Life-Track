import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_track/constants/constants_widgets.dart';
import 'package:life_track/controllers/activitymenu_controller.dart';
import 'package:life_track/controllers/image_controller.dart';
import 'package:life_track/views/dashboard_screens/profile_screen.dart';
import 'package:life_track/widgets/custom_button.dart';
import 'package:life_track/widgets/custom_header.dart';
import 'package:life_track/widgets/custom_line_chart.dart';
import 'package:sizer/sizer.dart';
import '../../constants/color_constants.dart';
import '../../widgets/custom_Leaderboard.dart';
import '../../widgets/custom_cpi.dart';

class ActivityMenu extends StatelessWidget {

  final String headerTitle;
  final String cpiImagePath;
  final bool isChart;

  ActivityMenu({
    required this.headerTitle,
    required this.cpiImagePath,
    required this.isChart,
    Key? key,
  }) : super(key: key);

  final ImageController imageController = Get.find<ImageController>();
  final ActivityMenuController activityController = Get.put(ActivityMenuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageController.activity_menu,
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              SizedBox(height: 5.h),
              // If header_title is null, show default text
              customHeader(headerTitle),


              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 2.h),
                      customText(
                        text: 'Every 15 Miles Gives 10 Pak Points',
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: 2.5.h),
                      isChart == false
                          ? customCPI(cpiImagePath)
                          : CustomLineChart(
                        bpmValues: [60, 97, 80, 140, 60],
                        minutes: [0, 5, 10, 15, 20],
                      ),


                      SizedBox(height: isChart == false ? 4.25.h: 1.h),
                      isChart == false ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildContainer('assets/images/icons/fire.png', '6.89', 'kcal burned'),
                          buildContainer('assets/images/icons/star.png', '12', 'Pak points'),
                          buildContainer('assets/images/icons/clock.png', '37', 'mins consumed'),
                        ],
                      ): SizedBox.shrink(),
                      SizedBox(height: isChart == false ? 1.5.h: 1.h),
                      customText(
                        text: 'Leaderboard',
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 17.sp,
                      ),
                      SizedBox(height: 1.5.h),
                      buildLeaderboard(),
                      SizedBox(height: 2.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            padding: EdgeInsets.only(
              left: 4.w,
              right: 4.w,
              top: 1.5.h,
              bottom: 2.h, // 🔹 increased bottom padding to lift button
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.25), // glass transparency
              border: Border(
                top: BorderSide(
                  color: Colors.white.withOpacity(0.25),
                  width: 0.5,
                ),
              ),
            ),
            child: SafeArea(
              top: false,
              child: Obx(() => customButton(
                activityController.isContinue.value == false ? 'Continue' : 'Stop',
                color: activityController.isContinue.value == false ? buttonColor : blackColor,
                ontap: () {
                  activityController.toggleIsContinue();
                },
                path: activityController.isContinue.value == false
                    ? 'assets/images/icons/play.png'
                    : 'assets/images/icons/stop.png',
                isImage: true,
              )),
            ),
          ),
        ),
      ),

    );
  }
}





Widget customCPI(String path) {
  return Stack(
    clipBehavior: Clip.none, // important to allow overflow outside stack
    children: [
      ProgressCircle(
        progress: 0.4,
        path: path,
      ),
      Positioned(
        bottom: -2.h, // half of container height outside
        left: 8.w,
        right: 8.w, // center horizontally (50.w container, screen width 100.w)
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14.sp),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              height: 8.h,
              width: 50.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.sp),
                color: Colors.white.withOpacity(
                  0.2,
                ), // semi-transparent overlay
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 1.4.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        customText(
                          text: '27.35',
                          color: Colors.white,
                          fontSize: 19.8.sp,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                        ),
                        customText(
                          text: 'miles covered',
                          color: Colors.white.withValues(alpha: 0.5),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          height: 1,
                          letterSpacing: -0.6,
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 3.w),
                      height: 4.h,
                      width: 0.2.w,
                      color: Colors.white.withValues(alpha: 0.5),
                    ),
                    Column(
                      children: [
                        customText(
                          text: '37%',
                          color: Colors.white,
                          fontSize: 19.8.sp,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                        ),
                        customText(
                          text: 'goal achieved',
                          color: Colors.white.withValues(alpha: 0.5),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          height: 1,
                          letterSpacing: -0.6,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
