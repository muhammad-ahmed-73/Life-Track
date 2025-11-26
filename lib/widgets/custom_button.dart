import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/color_constants.dart';
import '../constants/constants_widgets.dart';

Widget customButton(
    String title, {
      VoidCallback? ontap,
      String? path,
      bool? isImage = false,
      Color? color,
    }) {
  return Material(
    color: color ?? buttonColor,                // Background must be on Material
    borderRadius: BorderRadius.circular(25.sp),
    child: InkWell(
      onTap: ontap,
      borderRadius: BorderRadius.circular(25.sp),
      splashColor: Colors.white.withOpacity(0.2),
      highlightColor: Colors.white.withOpacity(0.1),
      child: Container(
        alignment: Alignment.center,
        height: 5.5.h,
        width: double.infinity,
        // REMOVE background color from Container!!!
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.sp),
        ),
        child: isImage == true
            ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(path ?? '', width: 3.5.w),
            SizedBox(width: 2.w),
            customText(
              text: title,
              fontSize: 16.5.sp,
              fontWeight: FontWeight.w600,
              color: whiteColor,
              fontFamily: 'degular',
            ),
          ],
        )
            : customText(
          text: title,
          fontSize: 16.5.sp,
          fontWeight: FontWeight.w600,
          color: whiteColor,
          fontFamily: 'degular',
        ),
      ),
    ),
  );
}

