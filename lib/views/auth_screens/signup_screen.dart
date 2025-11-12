import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_track/constants/color_constants.dart';
import 'package:life_track/constants/constants_widgets.dart';
import 'package:life_track/controllers/auth_controller.dart';
import 'package:life_track/controllers/image_controller.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_success_dialog.dart';
import '../../widgets/custom_textfield.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final AuthController authController = Get.put(AuthController());
  final ImageController imageController = Get.find<ImageController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:
        Obx(() {
          if (!imageController.isLoaded.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageController.signupBg, // Fixed here
                  fit: BoxFit.cover,

                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(
                  children: [
                    SizedBox(height: 9.5.h,),
                    Image.asset('assets/images/png/logo.png', width: 48.w,),
                    SizedBox(height: 3.5.h,),
                    customText(
                        text: 'Sign Up',
                        fontFamily: 'redditsans',
                        fontWeight: FontWeight.w700,
                        fontSize: 22.sp,
                        color: Colors.white
                    ),
                    customText(
                        text: 'Fill The Form below to create an account.',
                        fontFamily: 'redditsans',
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                        color: Colors.white
                    ),
                    SizedBox(height: 3.5.h,),
                    customTextField('Full Name', 'Enter Your Full Name'),
                    SizedBox(height: 1.5.h,),
                    customTextField('Email Address', 'Your@Email.com'),
                    SizedBox(height: 1.5.h,),
                    customTextField('Pin', '* * * *'),
                    SizedBox(height: 1.5.h,),
                    Row(
                      children: [
                        // Container(
                        //   alignment: Alignment.center,
                        //   height: 2.h,
                        //   width: 4.5.w,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(9.sp),
                        //       border: Border.all(color: whiteColor),
                        //   ),
                        //   //child: Icon(Icons.che, color: Colors.white,),
                        // ),
                        Obx(() => InkWell(
                            onTap: authController.toggleisCheck,
                            child: Icon(authController.isCheck == false ? Icons.check_box_outline_blank : Icons.check_box, color: Colors.white, size: 18.sp,))),
                        SizedBox(width: 1.5.w,),
                        customText(
                            text: 'I accept the Terms and Conditions and Privacy Policy',
                            fontSize: 14.5.sp,
                            color: whiteColor,
                            letterSpacing: -0.5
                        )
                      ],
                    ),
                    SizedBox(height: 2.h,),
                    InkWell(
                        onTap: (){
                          // Get.toNamed('/login');
                          showDialog(context: context, builder: (_) => successDialog('Account Registered successfully.', ontap: (){
                            Get.toNamed('/login',);
                          }));
                        },
                        child: customButton('Sign Up')),
                    SizedBox(height: 2.5.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        customText(
                            text: 'Already have an account?',
                            color: whiteColor,
                            fontSize: 15.sp
                        ),
                        SizedBox(width: 1.w,),
                        InkWell(
                          onTap: (){
                            Get.toNamed('/login');
                          },
                          child: Column(
                            children: [
                              customText(
                                  text: 'Sign In',
                                  color: buttonColor,
                                  height: 0,
                                  fontSize: 15.sp

                              ),
                              Container(
                                height: 0.1.h,
                                width: 11.w,
                                color: buttonColor,
                              )
                            ],
                          ),
                        )
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
