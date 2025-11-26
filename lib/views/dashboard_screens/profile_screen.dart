import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:life_track/controllers/image_controller.dart';
import 'package:life_track/widgets/custom_bar_chart.dart';
import 'package:sizer/sizer.dart';

import '../../constants/color_constants.dart';
import '../../constants/constants_widgets.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ImageController imageController = Get.find<ImageController>();
  final List<double> myValues = [30, 70, 20, 90, 60, 25, 40];
  final List<String> myDays = ["M", "T", "W", "T", "F", "S", "Today"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageController.profilesetting,
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              children: [
                SizedBox(height: 2.h),
                Row(
                  children: [
                    customText(
                      text: 'My Profile',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      height: 0,
                      letterSpacing: -0.2,
                    ),
                    Spacer(),
                    InkWell(
                      onTap: (){
                        Get.toNamed('/profilesetting');
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 2.6.w,
                          vertical: 1.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.settings_outlined,
                          color: Colors.white,
                          size: 19.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        // Profile Container
                        blurContainer(
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 6.h,
                                      width: 14.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/png/person1.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 3.w),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        customText(
                                          text: "Alex Smith",
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                        ),
                                        customText(
                                          text: "New York, NY",
                                          fontSize: 13.5.sp,
                                          color: Colors.white.withOpacity(0.7),
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 1.5.h),
                                customText(
                                  text:
                                  'Lorem ipsum dolor sit amet consectetur. Viverra tellus egemag na sapien. Faucibus nibh mauris mattis aliquam proin pe ll entes que sed done Nu lla sed consequat.',
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 14.sp,
                                  maxLines: null,      // allows unlimited lines
                                  softWrap: true,      // ensures text wraps to next line
                                  overFlow: TextOverflow.visible, // optional, ensures overflow doesn't clip
                                  height: 1.2,
                                ),
                                SizedBox(height: 1.5.h),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        customText(
                                          text: 'Earned Points',
                                          color: Colors.white.withOpacity(0.8),
                                          fontSize: 15.5.sp,
                                          height: 0,
                                        ),
                                        customText(
                                          text: '2,200',
                                          color: Colors.white,
                                          fontSize: 16.5.sp,
                                          fontWeight: FontWeight.w600,
                                          height: 0,
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 8.w),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        customText(
                                          text: 'Physical Goal',
                                          color: Colors.white.withOpacity(0.8),
                                          fontSize: 15.5.sp,
                                          height: 0,
                                        ),
                                        customText(
                                          text: 'Being In Shape',
                                          color: Colors.white,
                                          fontSize: 16.5.sp,
                                          fontWeight: FontWeight.w600,
                                          height: 0,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 1.h),
                        // Graph Container
                        blurContainer(
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.h,  horizontal: 5.w),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(FontAwesomeIcons.heartPulse, color: Colors.white, size: 16.5.sp),
                                    SizedBox(width: 2.w),
                                    customText(
                                      text: 'Your Activities',
                                      color: Colors.white,
                                      fontSize: 16.5.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    Spacer(),
                                    InkWell(
                                        onTap: (){
                                          Get.toNamed('/activitysummary');
                                        },
                                        child: Icon(Icons.arrow_forward_outlined, color: Colors.white, size: 18.5.sp)),
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
                                          text: 'Event Attend',
                                          color: Colors.white.withOpacity(0.8),
                                          fontSize: 15.5.sp,
                                        ),
                                        customText(
                                          text: '8',
                                          color: Colors.white,
                                          fontSize: 16.5.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 0.5.h),
                                CustomBarChart(values: myValues, days: myDays, height: 19.h),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 1.h),
                        blurContainer(
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.h,  horizontal: 5.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText(
                                  text: 'Recent posts',
                                  color: Colors.white,
                                  fontSize: 16.5.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(height: 1.h),
                                recentPost(
                                  'assets/images/png/person1.png',
                                  'Stewart Borer',
                                  'Lorem ipsum dolor sit amet consectetur. Viverra tellus egemag na sapien. Faucibus nibh mauris mattis aliquam proin pe ll entes que sed done Nu lla sed consequat.',
                                ),recentPost(
                                  'assets/images/png/person1.png',
                                  'Stewart Borer',
                                  'Lorem ipsum dolor sit amet consectetur. Viverra tellus egemag na sapien. Faucibus nibh mauris mattis aliquam proin pe ll entes que sed done Nu lla sed consequat.',
                                  isLast: true
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Blur Container remains same
Widget blurContainer(Widget child, {bool? isBorder = true}) {
  return Container(
    width: double.infinity,
    //margin: EdgeInsets.symmetric(vertical: 1.h),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15.sp),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15.sp),
            border: Border.all(color: isBorder == true ? Colors.white.withOpacity(0.35): Colors.transparent),
          ),
          child: child,
        ),
      ),
    ),
  );
}

// Recent Post fixed
Widget recentPost(String path, String name, String desc, {bool isLast = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 6.h,
            width: 10.5.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 2.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(
                text: name,
                fontSize: 17.5,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              customText(
                text: '2hrs Ago',
                fontSize: 13.sp,
                color: Colors.white.withOpacity(0.7),
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          Spacer(),
          Icon(FontAwesomeIcons.ellipsis, color: Colors.white, size: 16.5.sp),
        ],
      ),
      SizedBox(height: 0.5.h),
      customText(
        text: desc,
        color: Colors.white.withOpacity(0.8),
        fontSize: 14.sp,
        maxLines: null,      // allows unlimited lines
        softWrap: true,      // ensures text wraps to next line
        overFlow: TextOverflow.visible, // optional, ensures overflow doesn't clip
        height: 1.2,
      ),
      SizedBox(height: 1.h),
      Image.asset('assets/images/png/post.png'),
      SizedBox(height: 1.h),
      isLast == false ? Divider(): SizedBox.shrink()
    ],
  );
}
