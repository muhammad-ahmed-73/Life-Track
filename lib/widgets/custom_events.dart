import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_track/views/menu_screens/event_detail_screen.dart';
import 'package:sizer/sizer.dart';

import '../constants/color_constants.dart';
import '../constants/constants_widgets.dart';

Widget customEvents(String path, String title, String desc, String location, String date, String month,{VoidCallback? ontap}){
  return Container(
    margin: EdgeInsets.only(bottom: 1.25.h),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(
        14.sp,
      ), // clip everything to rounded corners
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.8.h),
            height: 22.h,
            width: double.infinity,
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
            right: -16.5.w,
            top: -3.h,
            child: Container(
              height: 28.h,
              width: 60.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(path), // Fixed here
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 2.h,
            left: 4.5.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(
                  text: title,
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  height: 0,
                ),
                SizedBox(height: 0.4.h,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, color: Colors.white, size: 14.sp,),
                    //SizedBox(width: 1.w,),
                    customText(
                        text: location,
                        fontSize: 14.sp,
                        color: Colors.white,
                      fontWeight: FontWeight.w600
                    ),

                  ],
                ),
                SizedBox(height: 0.4.h,),
                SizedBox(
                  width: 37.w,
                  child: customText(
                      text: desc,
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    maxLines: null,
                    softWrap: true,
                    overFlow: TextOverflow.visible
                  ),
                ),
                SizedBox(height: 0.8.h,),
                InkWell(
                  onTap: ontap,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 0.6.h),
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
              ],
            ),
          ),

          Positioned(
            top: 10.h,
            left: 42.w,
            child: Container(
              height: 8.h,
              width: 17.w,
              decoration: BoxDecoration(
                color: statusColor,
                shape: BoxShape.circle
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  customText(
                    text: 'Start',
                    color: Colors.white,
                    height: 1,        // IMPORTANT
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  customText(
                    text: date,
                    color: Colors.white,
                    height: 1,        // IMPORTANT
                    fontWeight: FontWeight.w900,
                    fontSize: 20.sp,
                  ),
                  customText(
                    text: month,
                    color: Colors.white,
                    height: 1,        // IMPORTANT
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              )

            )
          ),
        ],
      ),
    ),
  );
}