import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:life_track/views/menu_screens/user_profile_screen.dart';
import 'package:sizer/sizer.dart';

import '../constants/color_constants.dart';
import '../constants/constants_widgets.dart';
import '../controllers/activitymenu_controller.dart';
import '../views/dashboard_screens/profile_screen.dart';

Widget buildLeaderboard() {
  final ActivityMenuController activityController = Get.find();

  final List<Map<String, dynamic>> players = [
    {'rank': '01', 'path': 'assets/images/png/person4.png', 'name': 'Alicia Zieme', 'date': '17 May 2025', 'score': '3400'},
    {'rank': '02', 'path': 'assets/images/png/person5.png', 'name': 'Grant Grant', 'date': '17 May 2025', 'score': '3300'},
    {'rank': '03', 'path': 'assets/images/png/person2.png', 'name': 'Bernice Welch', 'date': '17 May 2025', 'score': '2965'},
    {'rank': '04', 'path': 'assets/images/png/person1.png', 'name': 'Rufus Schulist', 'date': '17 May 2025', 'score': '2965'},
    {'rank': '05', 'path': 'assets/images/png/person2.png', 'name': 'Kathleen Cormier', 'date': '17 May 2025', 'score': '2965'},
    {'rank': '06', 'path': 'assets/images/png/person3.png', 'name': 'Glenn Powlowski', 'date': '17 May 2025', 'score': '2965'},
    {'rank': '07', 'path': 'assets/images/png/person4.png', 'name': 'Sadie Ruecker', 'date': '17 May 2025', 'score': '2965'},
    {'rank': '08', 'path': 'assets/images/png/person5.png', 'name': 'Matthew Renner', 'date': '17 May 2025', 'score': '2965'},
    {'rank': '09', 'path': 'assets/images/png/person3.png', 'name': 'Ameli Shanahan', 'date': '17 May 2025', 'score': '2965'},
    {'rank': '10', 'path': 'assets/images/png/person4.png', 'name': 'Todd Haley', 'date': '17 May 2025', 'score': '2965'},
  ];
  List<String> optionsList = ['All Sports', 'Biking', 'Swimming', 'Kayaking'];

  return Container(
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.18),
      borderRadius: BorderRadius.circular(14.sp),
      border: Border.all(color: Colors.white.withOpacity(0.3)),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min, // 👈 Important: shrink to fit content
      children: [
        // SizedBox(height: 1.h,),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 4.w),
        //   child: SizedBox(
        //     height: 3.h,
        //     child: ListView.builder(
        //       scrollDirection: Axis.horizontal,
        //       itemCount: optionsList.length,
        //       itemBuilder: (context, index) {
        //         return optionsLeaderboard(
        //           optionsList[index],
        //           ontap: () => activityController.updateIsOptionLeaderboard(index),
        //           index: index,
        //         );
        //       },
        //     ),
        //   ),
        // ),
        //SizedBox(height: 0.8.h),
        // Header bar
        Container(
          margin: EdgeInsets.symmetric(vertical: 0.8.h, horizontal: 1.8.w),
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          height: 3.25.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.35),
            borderRadius: BorderRadius.circular(20.sp),
          ),
          child: Row(
            children: [
              customText(text: 'Rank', color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w600),
              SizedBox(width: 8.w),
              customText(text: 'Player', color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w600),
              Spacer(),
              customText(text: 'Points System', color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w600)
            ],
          ),
        ),

        // Auto-height list
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: ListView.separated(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,        // 👈 Important: list only takes space it needs
            itemCount: players.length,
            separatorBuilder: (_, __) => Divider(
              height: 0,
              thickness: 1,
              color: Colors.white.withOpacity(0.15),
            ),
            itemBuilder: (context, index) {
              final player = players[index];

              return InkWell(
                onTap: (){
                  Get.to(() => UserProfileScreen(imagePath: player['path'], name: player['name'], score: player['score'], isTop: index == 0 ? true : false,));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Row(
                    children: [
                      index == 0
                          ? Icon(FontAwesomeIcons.crown, color: Colors.amber, size: 17.sp)
                          : customText(
                        text: player['rank'],
                        color: Colors.white,
                        fontSize: 16.5.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(width: 10.w),

                      CircleAvatar(radius: 4.5.w, backgroundColor: Colors.white24,
                        child: Image.asset(player['path']),

                      ),
                      SizedBox(width: 3.w),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText(
                            text: player['name'],
                            color: Colors.white,
                            fontSize: 16.5.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          customText(
                            text: player['date'],
                            color: Colors.white54,
                            fontSize: 14.sp,
                          ),
                        ],
                      ),
                      Spacer(),

                      customText(
                        text: player['score'],
                        color: Colors.white,
                        fontSize: 16.5.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget buildContainer(String path, String title, String desc){
  return SizedBox(
    width: 29.w,       // or any width
    height: 11.5.h,
    child: blurContainer(
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(path, width: 7.5.w,),
            SizedBox(height: 0.5.h,),
            customText(
              text: title,
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              height: 1.3,
            ),
            customText(
              text: desc,
              color: Colors.white.withValues(alpha: 0.5),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 1,
              //letterSpacing: -0.6,
            ),
          ],
        )
    ),
  );
}

Widget optionsLeaderboard(String title, {Icon? icon, bool? isIcon = false, VoidCallback? ontap, int? index}) {
  final ActivityMenuController activityController = Get.find();

  return Obx(() {
    final isSelected = activityController.isOptionLeaderboard.value == index;

    return Container(
      margin: EdgeInsets.only(right: 1.5.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.sp),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: InkWell(
            onTap: ontap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.5.h),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
                color: isSelected ? statusColor : Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15.sp),
              ),
              child: isIcon == false
                  ? customText(
                text: title,
                color: isSelected ? Colors.white : Colors.white.withOpacity(0.8),
                fontSize: 14.5.sp,
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
