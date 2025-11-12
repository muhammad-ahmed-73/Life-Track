import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

import '../constants/color_constants.dart';
import '../constants/constants_widgets.dart';

Widget customPinField({Function(String)? onCompleted, BuildContext? context}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 1.h),
      PinCodeTextField(
        appContext: context!, // provide your context
        length: 4,
        obscureText: false,
        animationType: AnimationType.scale,
        keyboardType: TextInputType.number,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(12.sp),
          fieldHeight:8.5.h,
          fieldWidth: 19.w,
          activeFillColor: Colors.white.withOpacity(0.1),
          inactiveFillColor: Colors.white.withOpacity(0.1),
          selectedFillColor: Colors.white.withOpacity(0.15),
          activeColor: Colors.transparent,
          inactiveColor: Colors.transparent,
          selectedColor: Colors.transparent,
        ),
        cursorColor: whiteColor,
        textStyle: TextStyle(
          fontSize: 20.sp,
          color: whiteColor,
          fontWeight: FontWeight.bold,
        ),
        enableActiveFill: true,
        onChanged: (value) {},
        onCompleted: onCompleted,
      ),
    ],
  );
}
