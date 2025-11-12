import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_track/controllers/image_controller.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants_widgets.dart';
import '../../widgets/custom_button.dart';


class GetnotifiedScreen extends StatelessWidget {
  GetnotifiedScreen({Key? key}) : super(key: key);
  final ImageController imageController = Get.find<ImageController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageController.getnotified, // Fixed here
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.w),

          child: Column(
                children: [
                  // Placeholder for Status Bar (e.g., iPhone notch/status)
                  SizedBox(height: 8.h),

                  // Notification Stack (Top-aligned)
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 5.w),
                  //   child: Column(
                  //     children: [
                  //       _NotificationTile(
                  //         title: 'Community Updates',
                  //         subtitle: 'Messages, invites, and leaderboard shoutouts.',
                  //         time: '3h Ago',
                  //         color: Color(0xFF90F053).withOpacity(0.9), // Green with slight opacity
                  //       ),
                  //       _NotificationTile(
                  //         title: 'Local Events',
                  //         subtitle: 'Get alerts for group rides, runs, and games near you.',
                  //         time: '1h Ago',
                  //         color: Color(0xFF90F053).withOpacity(0.95),
                  //       ),
                  //       _NotificationTile(
                  //         title: 'Challenges & Rewards',
                  //         subtitle: 'Never miss a points milestone or prize!',
                  //         time: 'Now',
                  //         color: Color(0xFF90F053), // Solid Green
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  //
                  // SizedBox(height: 10.h),

                  // Main Text Content
                  Column(
                    children: [
                      Image.asset('assets/images/png/getnotified.png', width: 100.w,),
                      SizedBox(height:4.h,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Column(
                          children: [
                            customText(
                              textAlign: TextAlign.center,
                              text: 'Stay In The Loop! Turn\nOn Notifications',
                              color: Colors.white,
                              fontSize: 22.sp, // Approx 30-34pt font size
                              fontWeight: FontWeight.w700,
                              height: 1.2,
                            ),
                            SizedBox(height: 1.5.h),
                            customText(
                              textAlign: TextAlign.center,
                              text:
                              'Never miss out! Get alerts for points, events, and community updates to keep your GAME ON! journey exciting.',
                              color: Colors.white,
                              fontSize: 14.5.sp,
                            ),
                            SizedBox(height: 4.5.h),

                            // Feature List
                            _FeatureItem(
                              path: 'assets/images/icons/Gift box.png',
                              title: 'Challenges & Rewards',
                              subtitle: 'Never miss a points milestone or prize!',
                            ),
                            _FeatureItem(
                              path: 'assets/images/icons/Party.png',
                              title: 'Local Events',
                              subtitle:
                              'Stay in the loop about group rides, runs, and games happening nearby!',
                            ),
                            _FeatureItem(
                              path: 'assets/images/icons/Mountain.png',
                              title: 'Milestone & Benefits',
                              subtitle:
                              'Hit milestones and unlock exclusive rewards. Earn points, level up, and claim your perks.',
                            ),
                            SizedBox(height: 4.5.h,),
                            customButton('Enable', ontap: () => Get.toNamed('/getnotified'), path: 'assets/images/icons/notify.png',isImage: true),
                            SizedBox(height: 2.h,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                customText(
                                    text: 'Not Now',
                                    color: Colors.white,
                                    fontSize: 16.5.sp
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),

                ],
              ),
        ),
      ));
  }
}

// Widget for the feature items in the middle of the screen
class _FeatureItem extends StatelessWidget {
  final String path;
  final String title;
  final String subtitle;

  const _FeatureItem({
    required this.path,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon
          Image.asset(path, width: 8.w,),
          SizedBox(width: 4.w,),
          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(
                  text: title,
                  color: Colors.white,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
                customText(
                  text: subtitle,
                  color: Colors.white70,
                  fontSize: 15.sp,
                  height: 1.3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}