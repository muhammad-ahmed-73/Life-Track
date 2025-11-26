import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/color_constants.dart';
import '../constants/constants_widgets.dart';

Widget customTextField(
    String title,
    String hintText, {
      bool? isTitle = true,
      Function(String)? onChanged,   // <--- ADDED
    }) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(12.sp),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.sp),
              color: whiteColor.withOpacity(0.2),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
                vertical: isTitle == true ? 1.2.h : 2.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isTitle == true)
                    customText(
                      text: title,
                      color: whiteColor,
                      fontSize: 14.sp,
                    ),

                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: onChanged,  // <--- ADDED
                          decoration: InputDecoration(
                            hintText: hintText,
                            hintStyle: TextStyle(
                              color: whiteColor.withOpacity(0.8),
                              fontSize: 15.sp,
                            ),
                            border: InputBorder.none,
                            isDense: true,
                          ),
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 15.5.sp,
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
  );
}
