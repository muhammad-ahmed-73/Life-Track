import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:life_track/constants/color_constants.dart';
import 'package:life_track/constants/constants_widgets.dart';
import 'package:life_track/controllers/dashboard_controller.dart';
import 'package:life_track/controllers/image_controller.dart';
import 'package:sizer/sizer.dart';

import '../menu_screens/activity_menu.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final ImageController imageController = Get.find<ImageController>();
  final DashboardController dashboardController = Get.find<DashboardController>();
  List<Map<String, String>> activitiesArray = [
    {
      'image': 'assets/images/png/activities/off_road.png',
      'label': 'Off Road Biking',
    },
    {'image': 'assets/images/png/activities/biking.png', 'label': 'Biking'},
    {'image': 'assets/images/png/activities/running.png', 'label': 'Running'},
    {'image': 'assets/images/png/activities/hiking.png', 'label': 'Hiking'},
    {'image': 'assets/images/png/activities/kayaking.png', 'label': 'Kayaking'},
    {
      'image': 'assets/images/png/activities/windsurfing.png',
      'label': 'Wind Surfing',
    },
  ];
  final List<Map<String, String>> customEventsList = [
    {
      "path": "assets/images/png/activities/kayaking.png",
      "title": "Kayaking\nEvent",
    },
    {
      "path": "assets/images/png/activities/ship.png",
      "title": "Swimming\nEvent",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageController.home, // Fixed here
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(
                        text: 'Good Morning!',
                        fontSize: 20.5.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        height: 0,
                        letterSpacing: -0.2,
                      ),
                      customText(
                        text: 'Alex Smith',
                        fontSize: 17.5.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        height: 0,
                        letterSpacing: -0.2,
                      ),
                    ],
                  ),
                  Spacer(),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Notification Icon
                      InkWell(
                        onTap: (){
                          Get.toNamed('/notification');
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 3.w,
                            vertical: 1.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.notifications_none_outlined,
                            color: Colors.white,
                            size: 20.5.sp,
                          ),
                        ),
                      ),
                      // Status dot
                      Positioned(
                        top: 1.35.h, // adjust as needed
                        right: 3.5.w, // adjust as needed
                        child: Container(
                          height: 0.8.h,
                          width: 2.w,
                          decoration: BoxDecoration(
                            color: statusColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18.sp),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 8,
                    sigmaY: 8,
                  ), // blur for frosted effect
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: 2.h,
                    ),
                    //height: 16.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: whiteColor.withOpacity(0.2), // semi-transparent
                      borderRadius: BorderRadius.circular(18.sp),
                      border: Border.all(color: whiteColor.withOpacity(0.3)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            customText(
                              text: 'Your Current Points',
                              fontSize: 16.5.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            Spacer(),
                            customText(
                              text: 'View Rewards',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                            SizedBox(width: 1.5.w),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 16.sp,
                            ),
                          ],
                        ),
                        SizedBox(height: 1.h),
                        Row(
                          children: [
                            customText(
                              text: 'What\'s Your Plans Today',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                            Spacer(),
                            Icon(Icons.star, color: starColor, size: 18.5.sp),
                            SizedBox(width: 0.5.w),

                            customText(
                              text: '2,200/',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                            customText(
                              text: '10000',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: buttonColor,
                            ),
                            SizedBox(width: 0.5.w),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.w),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              double progressValue = 0.55; // your current value
                              double progressWidth =
                                  constraints.maxWidth * progressValue;

                              return Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  // Linear Progress Bar
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(25.sp),
                                    child: SizedBox(
                                      height: 1.h,
                                      child: LinearProgressIndicator(
                                        value: progressValue,
                                        color: statusColor,
                                        backgroundColor: Colors.white
                                            .withOpacity(0.3),
                                      ),
                                    ),
                                  ),
                                  // Star Icon at the end of progress
                                  Positioned(
                                    left:
                                        progressWidth -
                                        (10.sp), // adjust half of icon width
                                    top: -0.8
                                        .h, // slightly above the progress bar
                                    child: Icon(
                                      Icons.star,
                                      color: whiteColor,
                                      size: 19.sp,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),

                        SizedBox(height: 0.4.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 3.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: customViewAll('Activities', ontap: dashboardController.jumpToActivity),
            ),
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.only(left: 4.w),
              child: SizedBox(
                height: 20.h,
                child: ListView.builder(
                  itemCount: activitiesArray.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                          onTap: () {
                            Get.to(() =>
                                ActivityMenu(
                                  headerTitle: activitiesArray[index]["label"]!, 
                                  cpiImagePath: activitiesArray[index]["image"]!, isChart: false,
                                ));
                          },
                      child: customActivities(
                        activitiesArray[index]['image']!,
                        activitiesArray[index]['label']!,
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 4.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: customViewAll('Events Near You', ontap: dashboardController.jumpToEvent),
            ),
            SizedBox(height: 1.5.h),
            Padding(
              padding: EdgeInsets.only(left: 4.w),
              child: SizedBox(
                height: 18.h,
                child: ListView.builder(
                  itemCount: customEventsList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return homecustomEvents(
                      customEventsList[index]['path']!,
                      customEventsList[index]['title']!,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget customViewAll(String title, {VoidCallback? ontap}) {
  return Row(
    children: [
      customText(
        text: title,
        fontSize: 17.5.sp,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        height: 0,
        letterSpacing: -0.2,
      ),
      Spacer(),
      InkWell(
        onTap: ontap,
        child: customText(
          text: 'View All',
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: Colors.white,
          height: 0,
          letterSpacing: -0.2,
        ),
      ),
      SizedBox(width: 2.w),
      Icon(Icons.arrow_forward, color: Colors.white, size: 17.sp),
    ],
  );
}

Widget customActivities(String path, String title,) {
  final DashboardController controller = Get.find<DashboardController>();
  return Container(
    margin: EdgeInsets.only(right: 2.5.w),
    padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
    height: 18.h,
    width: 38.w,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14.sp),
      image: DecorationImage(
        image: AssetImage(path), // Fixed here
        fit: BoxFit.cover,
      ),
      border: Border.all(color: Colors.grey.withValues(alpha: 0.5)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        customText(
          text: title,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ],
    ),
  );
}

Widget homecustomEvents(String path, String title) {
  return Container(
    margin: EdgeInsets.only(right: 2.5.w),

    child: ClipRRect(
      borderRadius: BorderRadius.circular(
        14.sp,
      ), // clip everything to rounded corners
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.8.h),
            height: 20.h,
            width: 82.w,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(14.sp),
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/png/activities/events.png',
                ), // Fixed here
                fit: BoxFit.cover,
              ),
              //border: Border.all(color: Colors.grey.withValues(alpha: 0.5))
            ),
          ),
          Positioned(
            right: -13.w,
            top: -3.h,
            child: Container(
              height: 25.h,
              width: 60.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(path), // Fixed here
                  fit: BoxFit.contain,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 3.h,
            left: 4.w,
            child: customText(
              text: title,
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              height: 0,
            ),
          ),
          Positioned(
            top: 12.h,
            left: 4.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 0.7.h),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(25.sp),
              ),
              child: customText(
                text: 'Join Now',
                textAlign: TextAlign.center,
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            top: 3.h,
            left: 34.w,
            child: Image.asset(
              'assets/images/png/activities/pointsdouble.png',
              width: 11.w,
            ),
          ),
        ],
      ),
    ),
  );
}
