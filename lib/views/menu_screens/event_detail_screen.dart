import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_track/constants/color_constants.dart';
import 'package:life_track/constants/constants_widgets.dart';
import 'package:life_track/views/dashboard_screens/profile_screen.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/image_controller.dart';

class EventDetailScreen extends StatelessWidget {
  final String path;
  final String title;
  EventDetailScreen({required this.path, required this.title, super.key});
  final ImageController imageController = Get.find<ImageController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageController.event_detail,
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              SizedBox(height: 5.h,),
              Stack(
                children: [
                  Container(
                    height: 25.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.sp),
                        image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover)
                    ),
                  ),
                  Positioned(
                      left: 3.w,
                      top: 1.2.h,
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.25), // must be transparent!
                            ),
                            child: InkWell(
                                onTap: (){
                                  Get.back();
                                },
                                child: Icon(Icons.arrow_back, color: Colors.white)),
                          ),
                        ),
                      )
                  ),
                ],
              ),
              SizedBox(height: 1.5.h,),
              blurContainer(
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(
                        text: title,
                        fontSize: 17.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w700
                      ),
                      SizedBox(height: 0.8.h,),
                      customText(
                          text: 'Lorem ipsum dolor sit amet consectetur. Viverra tellus egemag na sapien. Faucibus nibh mauris mattis aliquam proin pe ll entes que sed done Nu lla sed consequat.',
                          fontSize: 14.sp,
                          color: Colors.white.withValues(alpha: 0.8),
                          fontWeight: FontWeight.w400,
                        maxLines: null,
                        softWrap: true,
                        overFlow: TextOverflow.visible,
                        height: 1.1
                      ),
                      SizedBox(height: 1.5.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                text: 'Distance',
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 15.5.sp,
                                height: 0,
                              ),
                              customText(
                                text: '34,000 Km',
                                color: Colors.white,
                                fontSize: 16.5.sp,
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ],
                          ),
                          //SizedBox(width: 8.w),
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
                          // SizedBox(width: 8.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                text: 'Time',
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 15.5.sp,
                                height: 0,
                              ),
                              customText(
                                text: '1h 33mins',
                                color: Colors.white,
                                fontSize: 16.5.sp,
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 1.h,),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                text: '+50 Pts',
                                color: buttonColor,
                                fontSize: 16.5.sp,
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ],
                          ),
                          SizedBox(width: 5.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                text: 'Event Ticket',
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 15.5.sp,
                                height: 0,
                              ),
                              customText(
                                text: '\$5',
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
                )
              ),
              SizedBox(height: 1.5.h,),
              Container(
                height: 32.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.sp),
                  image: DecorationImage(image: AssetImage('assets/images/png/map.png'), fit: BoxFit.cover)
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.sp),
          topRight: Radius.circular(18.sp),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.25),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.sp),
                topRight: Radius.circular(18.sp),
              ),
              // border: Border(
              //   top: BorderSide(color: Colors.white.withValues(alpha: 0.2), width: 1),
              // ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                // 🔹 Left Button
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 1.4.h),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25.sp),
                    ),
                    child: customText(
                      text: 'Not Now',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: Colors.white
                    )
                  ),
                ),
                SizedBox(width: 2.w,),
                // 🔹 Right Button
                InkWell(
                  onTap: () {},
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 1.4.h),
                      decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.circular(25.sp),
                      ),
                      child: customText(
                          text: 'Join Now',
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: Colors.white
                      )
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
