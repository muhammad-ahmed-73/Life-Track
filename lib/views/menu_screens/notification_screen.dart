import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:life_track/controllers/image_controller.dart';
import 'package:life_track/controllers/notification_controller.dart';
import 'package:life_track/widgets/custom_header.dart';

import '../../constants/color_constants.dart';
import '../../constants/constants_widgets.dart';
import 'activity_summary.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final List<String> optionsArray = [
    'All',
    'Unread',
    'Events & Challenges',
    'Community',
    'Achievements'
  ];
  final List<Map<String, String>> notificationArray = [
    {
      'title': "Don't Miss Tomorrow's Ride!",
      'desc': 'Coastal Bike Adventure starts in 12 hours. Tap to confirm your spot!'
    },
    {
      'title': 'You’ve Reached 2,000 Points!',
      'desc': 'Claim your engraved athletic shirt + 50 bonus points!'
    },
    {
      'title': 'Dude commented on your kayak post!',
      'desc': 'Great route! Let’s paddle together next weekend.'
    },
    {
      'title': 'You’re Top 10 in the Trail Run Challenge!',
      'desc': '2 days left—run 3 more miles to pass RunnerGirl!'
    },
    {
      'title': 'Dude commented on your kayak post!',
      'desc': 'Great route! Let’s paddle together next weekend.'
    },
    {
      'title': 'You’re Top 10 in the Trail Run Challenge!',
      'desc': '2 days left—run 3 more miles to pass RunnerGirl!'
    },

  ];


  final ImageController imageController = Get.find<ImageController>();
  final NotificationController notificationController =
  Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageController.notification,
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5.h),
              customHeader('Notifications'),
              SizedBox(height: 1.5.h),

              // Horizontal options list
              SizedBox(
                height: 3.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: optionsArray.length,
                  itemBuilder: (context, index) {
                    return notificationOptions(
                        optionsArray[index],
                        ontap: () => notificationController.updateSelectedIndex(index),
                        index: index);
                  },
                ),
              ),

              SizedBox(height: 1.5.h),

              // Wrap everything below options in SingleChildScrollView
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(
                        text: 'Today',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      SizedBox(height: 0.6.h),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return notification(
                            notificationArray[index]['title']!,
                            notificationArray[index]['desc']!,
                          );
                        },
                      ),
                      SizedBox(height: 1.5.h),
                      customText(
                        text: 'Yesterday',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      SizedBox(height: 1.h),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: notificationArray.length,
                        itemBuilder: (context, index) {
                          return notification(
                            notificationArray[index]['title']!,
                            notificationArray[index]['desc']!,
                          );
                        },
                      ),
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
Widget notificationOptions(String title, {VoidCallback? ontap, int? index}) {
  final NotificationController notificationController = Get.find<NotificationController>();

  return Obx(() {
    final isSelected = notificationController.selectedIndex.value == index;

    return Container(
      margin: EdgeInsets.only(right: 1.5.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.sp),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: InkWell(
            onTap: ontap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.4.h),
              decoration: BoxDecoration(
                color: isSelected ? buttonColor : Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15.sp),
              ),
              child: customText(
                text: title,
                color: isSelected ? Colors.white : Colors.white.withOpacity(.8),
                fontSize: 14.5.sp,
              ),
            ),
          ),
        ),
      ),
    );
  });
}
Widget notification(String title, String desc){
  return Row(

    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      // Circular status
      Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: statusColor,
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            customText(
              text: 'Game',
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              height: 1.2,
            ),
            customText(
              text: 'ON',
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              height: 1.2,
            ),
          ],
        ),
      ),

      SizedBox(width: 3.w),

      // Text content
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: customText(
                    text: title,
                    letterSpacing: -0.8,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                customText(
                  text: '12:19 PM',
                  fontSize: 14.6.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6),
                  height: 1.2,
                ),
              ],
            ),
            SizedBox(height: 0.3.h,),
            customText(
                text: desc,
                fontSize: 14.5.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.6),
                maxLines: 2,
                softWrap: true,
                overFlow: TextOverflow.visible,
                height: 1.3
            )
          ],
        ),
      ),
    ],
  );
}