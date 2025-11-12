import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_track/constants/constants_widgets.dart';
import 'package:sizer/sizer.dart';

import '../controllers/pin_controller.dart';

class CustomNumericKeyboard extends StatelessWidget {
  final PinController controller;
  final VoidCallback? onFingerprint;

  const CustomNumericKeyboard({
    Key? key,
    required this.controller,
    this.onFingerprint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _buildKeyboardRow(['1', '2', '3']),
          SizedBox(height: 0.h),
          _buildKeyboardRow(['4', '5', '6']),
          SizedBox(height: 0.h),
          _buildKeyboardRow(['7', '8', '9']),
          SizedBox(height: 0.h),
          _buildBottomRow(),
        ],
      ),
    );
  }

  Widget _buildKeyboardRow(List<String> numbers) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: numbers.map((number) => _buildKeyButton(number)).toList(),
    );
  }

  Widget _buildBottomRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

          SizedBox(width: 17.w),
        _buildKeyButton('0'),
        SizedBox(width: 9.w),
        _buildBackspaceButton(),
      ],
    );
  }

  Widget _buildKeyButton(String number) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 0.8.h),
      child: InkWell(
        onTap: () => controller.addDigit(number),
        //borderRadius: BorderRadius.circular(50.sp),
        child: Container(
          child: Center(
            child: customText(
              text: number,
              fontSize: 24.5.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontFamily: 'worksans'
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackspaceButton() {
    return InkWell(
      onTap: () => controller.removeDigit(),
      borderRadius: BorderRadius.circular(10.sp),
      child: Container(
        child: Icon(
          Icons.backspace_outlined,
          color: Colors.white,
          size: 22.sp,
        ),
      ),
    );
  }

  Widget _buildFingerprintButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: InkWell(
        onTap: onFingerprint,
        borderRadius: BorderRadius.circular(50.sp),
        child: Container(
          // width: 9.h,
          // height: 9.h,
          // decoration: BoxDecoration(
          //   color: Colors.white.withOpacity(0.2),
          //   shape: BoxShape.circle,
          //   border: Border.all(
          //     color: Colors.white.withOpacity(0.4),
          //     width: 1,
          //   ),
          // ),
          child: Icon(
            Icons.fingerprint,
            color: Colors.white,
            size: 28.sp,
          ),
        ),
      ),
    );
  }
}

// Modified PIN Code Field Widget
Widget pinCodeFieldWithCustomKeyboard({
  Function(String)? onCompleted,
  BuildContext? context,
  required PinController controller,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      // PIN Display Dots
      Obx(() {
        final pinLength = controller.pin.value.length;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.5.w),
              child: Container(
                width: 19.w,
                height: 8.5.h,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                child: Center(
                  child: index < pinLength
                      ? Text(
                    controller.pin.value[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                      : null,
                ),

              ),
            );
          }),
        );
      }),

      SizedBox(height: 2.h),

      // Forgot PIN link
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: (){
              Get.toNamed('/forget');
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                customText(
                  text: 'Forgot Pin?',
                  color: Colors.white,
                  height: 0,
                  fontSize: 14.5.sp,
                ),
                Container(
                  height: 0.15.h,
                  width: 16.5.w,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(width: 4.w),
        ],
      ),

      SizedBox(height: 2.h),


      // Custom Keyboard
      CustomNumericKeyboard(
        controller: controller,
        onFingerprint: () {
          // Handle fingerprint authentication
          print('Fingerprint pressed');
        },
      ),
    ],
  );
}

// Example Usage Screen
class PinCodeScreen extends StatelessWidget {
  final PinController pinController = Get.put(PinController());

  PinCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Listen for PIN completion
    ever(pinController.pin, (pin) {
      if (pinController.isComplete) {
        print('PIN Complete: $pin');
        // Call your onCompleted callback
        // onCompleted?.call(pin);
      }
    });

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter PIN',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 4.h),
              pinCodeFieldWithCustomKeyboard(
                context: context,
                controller: pinController,
                onCompleted: (pin) {
                  print('PIN entered: $pin');
                  Get.snackbar('Success', 'PIN: $pin');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}