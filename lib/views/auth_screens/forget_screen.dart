import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_track/constants/constants_widgets.dart';
import 'package:life_track/widgets/custom_button.dart';
import 'package:life_track/widgets/custom_textfield.dart';
import 'package:sizer/sizer.dart';

import '../../constants/color_constants.dart';
import '../../controllers/image_controller.dart';

class ForgetScreen extends StatelessWidget {
  ForgetScreen({super.key});
  final ImageController imageController = Get.find<ImageController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageController.forgetBg, // Fixed here
              fit: BoxFit.cover,
            ),
          ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              SizedBox(height: 10.h,),
              Image.asset('assets/images/png/logo.png', width: 42.w,),
              SizedBox(height: 3.h,),
              customText(
                text: 'Forgot Pin',
                fontSize: 22.sp,
                color: whiteColor,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 0.4.h,),
              customText(
                text: 'Enter an email address to receive a verification code.',
                fontSize: 15.sp,
                color: whiteColor,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 3.5.h,),
              customTextField('Email Address', "Your@Email.Com"),
              SizedBox(height: 4.h,),

              customButton('Continue', ontap: (){
                Get.toNamed('/verification');
              })
            ],
          ),
        ),
        )
    );
  }
}
