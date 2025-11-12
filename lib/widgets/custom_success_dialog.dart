import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constants/color_constants.dart';
import '../constants/constants_widgets.dart';
import 'custom_button.dart';

Widget successDialog(String description,{VoidCallback? ontap}){
  return Dialog(
    backgroundColor: Colors.transparent,
    insetPadding: EdgeInsets.symmetric(horizontal: 4.w), // remove edges

    child: Container(
      height: 28.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.h),
      decoration: BoxDecoration(
          color: Color(0xff575858),
          borderRadius: BorderRadius.circular(18.sp)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 1.h,),
          Image.asset('assets/images/icons/check_icon.png', width: 22.w,),
          SizedBox(height: 2.5.h,),
          customText(text: description, color: whiteColor, fontSize: 15.sp),
          SizedBox(height: 2.5.h,),
          customButton('Ok', ontap: ontap),

          SizedBox(height: 1.h,),

        ],
      ),
    ),
  );
}
