import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:life_track/constants/color_constants.dart';
import 'package:life_track/constants/constants_widgets.dart';
import 'package:life_track/controllers/pin_controller.dart';
import 'package:life_track/widgets/custom_Keyboard_Pinfield.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/image_controller.dart';
import '../../widgets/custom_pin_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final PinController pinController = Get.put(PinController());
  final ImageController imageController = Get.find<ImageController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (!imageController.isLoaded.value) {
          return Container(
              color: Colors.black,
              child: Center(child: CircularProgressIndicator()));
        } else {
          return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
        image: DecorationImage(
        image: imageController.loginBg, // Fixed here
        fit: BoxFit.cover,
        ),
        ),
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
        children: [
        SizedBox(height: 8.h,),
        Row(
        children: [
        InkWell(
        onTap: (){
        Get.back();
        },
        child: Icon(Icons.arrow_back_ios_new_rounded, color: whiteColor,))
        ],
        ),
        SizedBox(height: 2.h,),
        Icon(FontAwesomeIcons.faceSmile, color: whiteColor, size: 19.5.sp,),
        customText(
        text: 'Couldn\'t recognize you',
        fontSize: 15.sp,
        color: whiteColor,
        height: 0.28.h
        ),
        SizedBox(height: 0.3.h,),
        customText(
        text: 'Enter PIN or use fingerprint to log into',
        fontSize: 18.5.sp,
        fontWeight: FontWeight.w700,
        color: whiteColor,
        letterSpacing: -0.7,
        ),
        SizedBox(height: 2.5.h,),
        Image.asset('assets/images/png/logo.png', width: 38.w,),
        SizedBox(height: 5.h,),
        pinCodeFieldWithCustomKeyboard(context: context, controller: pinController),

        // CustomNumericKeyboard(controller: pinController,),
        SizedBox(height: 2.4.h,),
        Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        InkWell(
        onTap: (){
        Get.toNamed('/preferredsports');
        },
        child: Image.asset('assets/images/icons/circle.png', width: 16.w,))
        ],
        )
        ],
        ),
        ),
        ); // or your background container
        }
      })


    );
  }
}
