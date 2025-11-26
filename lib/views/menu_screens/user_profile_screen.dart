import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:life_track/controllers/image_controller.dart';
import 'package:life_track/widgets/custom_bar_chart.dart';
import 'package:life_track/widgets/custom_header.dart';
import 'package:sizer/sizer.dart';

import '../../constants/color_constants.dart';
import '../../constants/constants_widgets.dart';
import '../dashboard_screens/profile_screen.dart';

class UserProfileScreen extends StatelessWidget {
  final String imagePath;
  final String name;
  final String score;
  final bool isTop;

  UserProfileScreen({
    required this.imagePath,
    required this.name,
    required this.score,
    required this.isTop,
    Key? key,
  }) : super(key: key);
  final ImageController imageController = Get.find<ImageController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageController.userprofile,
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              children: [
                SizedBox(height: 2.h),
                customHeader('User Profile'),
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
                                          image: AssetImage(imagePath),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 3.w),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        customText(
                                          text: name,
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
                                  text: 'Lorem ipsum dolor sit amet consectetur. Viverra tellus egemag na sapien. Faucibus nibh mauris mattis aliquam proin pe ll entes que sed done Nu lla sed consequat.',
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 14.sp,
                                  maxLines: null,      // allows unlimited lines
                                  softWrap: true,      // ensures text wraps to next line
                                  overFlow: TextOverflow.visible, // optional, ensures overflow doesn't clip
                                  height: 1.2,         // line height (avoid 0)
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
                                        isTop == false ? customText(
                                          text: score,
                                          color: Colors.white,
                                          fontSize: 16.5.sp,
                                          fontWeight: FontWeight.w600,
                                          height: 0,
                                        ): Row(
                                          children: [
                                            Icon(FontAwesomeIcons.crown, color: Colors.amber, size: 17.sp),
                                            SizedBox(width: 2.w,),
                                            customText(
                                              text: score,
                                              color: Colors.white,
                                              fontSize: 16.5.sp,
                                              fontWeight: FontWeight.w600,
                                              height: 0,
                                            )
                                          ],
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
                                SizedBox(height: 1.5.h,),
                                Align(
                                  alignment: Alignment.centerLeft, // aligns the container to the left
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.h),
                                    height: 4.h,
                                    decoration: BoxDecoration(
                                      color: statusColor,
                                      borderRadius: BorderRadius.circular(25.sp),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset('assets/images/icons/bicycle.png'),
                                        SizedBox(width: 2.w),
                                        customText(
                                          text: '16 MPH Club',
                                          color: Colors.white,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                  ),
                                )

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
                                  imagePath,
                                  name,
                                  'Lorem ipsum dolor sit amet consectetur. Viverra tellus egemag na sapien. Faucibus nibh mauris mattis aliquam proin pe ll entes que sed done Nu lla sed consequat.',
                                ),recentPost(
                                  imagePath,
                                    name,
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