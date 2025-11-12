import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/color_constants.dart';
import '../constants/constants_widgets.dart';

Widget customButton(String title, {VoidCallback? ontap, String? path, bool? isImage = false}){
  return InkWell(
    onTap: ontap,
    child: Container(
      alignment: Alignment.center,
      height: 5.5.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(25.sp)
      ),
      child: isImage == true ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(path?? ''),
          SizedBox(width: 1.w,),
          customText(text: title, fontSize: 16.5.sp, fontWeight: FontWeight.w600, color: whiteColor, fontFamily: 'degular'),
        ],
      ):           customText(text: title, fontSize: 16.5.sp, fontWeight: FontWeight.w600, color: whiteColor, fontFamily: 'degular'),

    ),
  );
}