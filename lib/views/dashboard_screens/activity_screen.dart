import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:life_track/constants/color_constants.dart';
import 'package:life_track/constants/constants_widgets.dart';
import 'package:life_track/controllers/dashboard_controller.dart';
import 'package:life_track/controllers/image_controller.dart';
import 'package:life_track/views/dashboard_screens/dashboard_screen.dart';
import 'package:life_track/views/menu_screens/activity_menu.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/dashboard_controller.dart';

class ActivityScreen extends StatelessWidget {
  ActivityScreen({super.key});
  final ImageController imageController = Get.find<ImageController>();
  final DashboardController controller = Get.find<DashboardController>();
  List<Map<String, String>> activities = [
    {
      "path": "assets/images/png/activities/offroad_biking2.png",
      "title": "Off Road Biking",
      "desc": "It keeps you healthy, and 15 miles puts 10 Pak points in your pocket."
    },
    {
      "path": "assets/images/png/activities/biking.png",
      "title": "Biking",
      "desc": "Strengthen you feets, and 9 miles puts 10 Pak points in your pocket."
    },
    {
      "path": "assets/images/png/activities/running.png",
      "title": "Running",
      "desc": "Run 3 miles, stay fit and collect 10 Pak points."
    },
    {
      "path": "assets/images/png/activities/hiking.png",
      "title": "Hiking",
      "desc": "Build endurance on the trail, 4 miles rewards you with 10 Pak points."
    },
    {
      "path": "assets/images/png/activities/kayaking.png",
      "title": "Kayaking",
      "desc": "Conquer 3 miles of kayaking and collect 10 Pak points."
    },
    {
      "path": "assets/images/png/activities/windsurfing.png",
      "title": "Windsurfing",
      "desc": "Ride the waves for fitness, 15 miles of windsurfing = 10 Pak points."
    },
    {
      "path": "assets/images/png/activities/hiking.png",
      "title": "Swimming",
      "desc": "Explore nature and improve endurance with hikes."
    },
    {
      "path": "assets/images/png/activities/ship.png",
      "title": "Gym Workout",
      "desc": "Build strength and stay in shape with regular workouts."
    },
  ];
  List<Map<String, String>> sports = [
    {
      "path": "assets/images/png/activities/area_sports/basketball.png",
      "title": "Basketball",
      "desc": "It keeps you healthy, and 100 BPM puts 10 Pak points in your pocket."
    },
    {
      "path": "assets/images/png/activities/area_sports/soccer.png",
      "title": "Soccer",
      "desc": "Strengthen you feets, and 160 BPM puts 10 Pak points in your pocket."
    },
    {
      "path": "assets/images/png/activities/area_sports/weights.png",
      "title": "Weights",
      "desc": "Lift 25 lb, stay fit, and collect10 Pak points."
    },
    {
      "path": "assets/images/png/activities/area_sports/boxing.png",
      "title": "Boxing",
      "desc": "Beat your fats and burns 1000 calories and earn 10 Pak points"
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageController.activity, // Fixed here
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                children: [
                  SizedBox(height: 12.h,),
              Obx(() => Container(
                height: 5.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.sp),
                  color: Colors.white.withValues(alpha: 0.1),
                ),
                child: Row(
                  children: [
                    // LEFT TAB
                    Expanded(
                      child: InkWell(
                        onTap: controller.selectPreferred,
                        child: Container(
                          alignment: Alignment.center,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: controller.isPreferredSelected.value
                                ? buttonColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(
                              25.sp
                            ),
                          ),
                          child: customText(
                            textAlign: TextAlign.center,
                            text: 'Preferred Activity',
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),

                    // RIGHT TAB
                    Expanded(
                      child: GestureDetector(
                        onTap: controller.selectAreaSports,
                        child: Container(
                          alignment: Alignment.center,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: controller.isPreferredSelected.value
                                ? Colors.transparent
                                : buttonColor,
                            borderRadius: BorderRadius.circular(
                              25.sp
                            ),
                          ),
                          child: customText(
                            textAlign: TextAlign.center,
                            text: 'Area Sports',
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
                  SizedBox(height: 2.h,),
                  Obx(() => controller.isPreferredSelected.value == true ? SizedBox(
                    height: 72.h,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: activities.length,
                      itemBuilder: (context, index) {
                        final item = activities[index];
                        return InkWell(
                            onTap: () {
                              Get.to(() => ActivityMenu(
                                headerTitle: item["title"]!,
                                cpiImagePath: index == 0 ? ('assets/images/png/activity_menu.png')!: item["path"]!,
                                isChart: false,
                              ));
                            },
                            child: activity(item["path"]!, item["title"]!, item["desc"]!));
                      },
                    ),
                  ): SizedBox(
                    height: 70.5.h,
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: sports.length,
                        itemBuilder: (context, index){
                          final item = sports[index];
                          return InkWell(
                              onTap: () {
                                Get.to(() => ActivityMenu(
                                  headerTitle: item["title"]!,
                                  cpiImagePath: index == 0 ? ('assets/images/png/activities/basketball.png')!: item["path"]!,
                                  isChart: index == 3 ? true : false,
                                ));
                              },
                              child: activity(item['path']!, item['title']!, item['desc']!));
                        }),
                  )),
                ],
              ),
            ),
          ),

          // APP Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Container(
                  height: 10.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(0.35),  // glossy white top
                        Colors.white.withOpacity(0.10),  // fade out
                        Colors.white.withOpacity(0.02),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 5.h,),
                      customText(text: 'Activity', textAlign: TextAlign.center, color: Colors.white, fontSize: 21.sp, fontWeight: FontWeight.w700),
                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

Widget activity(String path, String title, String desc) {
  final DashboardController controller= Get.find<DashboardController>();
  return ClipRRect(
    borderRadius: BorderRadius.circular(14.sp),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // adjust blur as needed
      child: Container(
        margin: EdgeInsets.only(bottom: 1.25.h),
        padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 0.6.h),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.sp),
          color: Colors.white.withValues(alpha: 0.2),
          border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                child: Image.asset(
                  path,
                  width: 21.w,
                  height: 9.5.h,
                  fit: BoxFit.cover,
                ),
              ),
            SizedBox(width: 2.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: customText(
                          text: title,
                          fontWeight: FontWeight.w600,
                          fontSize: 17.sp,
                          color: Colors.white,
                          maxLines: 1,
                        ),

                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 2.w),
                        child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16.sp, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.2.h),
                  Padding(
                    padding: EdgeInsets.only(right: 2.w),
                    child: customText(
                      text: desc,
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14.sp,
                      maxLines: null,      // allows unlimited lines
                      softWrap: true,      // ensures text wraps to next line
                      overFlow: TextOverflow.visible, // optional, ensures overflow doesn't clip
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
