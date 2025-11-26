import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:life_track/constants/color_constants.dart';
import 'package:life_track/controllers/image_controller.dart';
import 'package:life_track/widgets/custom_events.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants_widgets.dart';

class EventsScreen extends StatelessWidget {
  EventsScreen({super.key});
  final ImageController imageController = Get.find<ImageController>();
  List<Map<String, String>> eventsCardList = [
    {
      "path": "assets/images/png/activities/kayaking.png",
      "title": "Kayaking Event",
      "desc": "Join our kayaking event explore waterways, meet paddlers, & earn points! Great for all skill levels.",
      "location": "Riverfront Dock, 12 Lake St",
      "date": "20",
      "month": "May",
    },
    {
      "path": "assets/images/png/activities/biking.png",
      "title": "Bike Racing",
      "desc": "Join bike racing event explore rough road, meet paddlers, & earn points! Great for all skill levels.",
      "location": "Riverfront Dock, 12 Lake St",
      "date": "07",
      "month": "June",
    },
    {
      "path": "assets/images/png/activities/hiking.png",
      "title": "Mountain Hiking",
      "desc": "Join our mountain hike, enjoy nature, and earn rewards along the trail.",
      "location": "Green Hills, 77 Mountain Rd",
      "date": "18",
      "month": "June",
    },
    {
      "path": "assets/images/png/activities/windsurfing.png",
      "title": "Wind Surfing",
      "desc": "Join wind surfing event explore waterways, meet paddlers, & earn points! Great for all skill levels.",
      "location": "Lagoon Pool, 90 Water St",
      "date": "5",
      "month": "July",
    },
    {
      "path": "assets/images/png/activities/running.png",
      "title": "Running Event",
      "desc": "Challenge yourself with our rock running event. Suitable for beginners & pros.",
      "location": "Cliffside Gym, 44 Rock Ave",
      "date": "10",
      "month": "July",
    },
    {
      "path": "assets/images/png/activities/off_road.png",
      "title": "Off Road Biking",
      "desc": "Experience thrilling off-road biking and earn points along the trail.",
      "location": "Trail Park, 55 Dirt Rd",
      "date": "15",
      "month": "July",
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
                image: imageController.events, // Fixed here
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 11.9.h,),
                  customText(
                    text: 'Challenges Near You',
                    fontSize: 16.5.sp,
                    fontWeight: FontWeight.w600,
                    color: whiteColor
                  ),
                  SizedBox(height: 1.25.h,),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 12.h),
                      itemCount: eventsCardList.length,
                      itemBuilder: (context, index) {
                        final item = eventsCardList[index];
                        return customEvents(
                          item['path']!,
                          item['title']!,
                          item['desc']!,
                          item['location']!,
                          item['date']!,
                          item['month']!,
                        );
                      },
                    ),
                  ),



                  //customEvents('assets/images/png/activities/biking.png', 'Bike Racing', 'Join our kayaking event \nexplore waterways, meet \npaddlers, & earn points! \nGreat for all skill levels.', 'Moe\'s Tavern, 555 S Main St', '20', 'June')
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
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  height: 11.h,
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 4.5.h,),
                          customText(text: 'Events', textAlign: TextAlign.center, color: Colors.white, fontSize: 21.sp, fontWeight: FontWeight.w700, height: 0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.location_on, color: Colors.white, size: 14.5.sp,),
                              SizedBox(width: 1.w,),
                              customText(
                                text: 'Moe\'s Tavern, 555 S Main St',
                                fontSize: 14.5.sp,
                                color: Colors.white
                              ),
                              SizedBox(width: 1.w,),
                              Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 18.sp,)
                            ],
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
                              margin: EdgeInsets.only(top: 3.5.h),
                              padding: EdgeInsets.symmetric(
                                horizontal: 2.6.w,
                                vertical: 0.9.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.notifications_none_outlined,
                                color: Colors.white,
                                size: 19.5.sp,
                              ),
                            ),
                          ),
                          // Status dot
                          Positioned(
                            top: 5.h, // adjust as needed
                            right: 13, // adjust as needed
                            child: Container(
                              height: 0.7.h,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
