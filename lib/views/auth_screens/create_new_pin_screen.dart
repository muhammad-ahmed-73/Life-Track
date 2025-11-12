import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_track/widgets/custom_pin_field.dart';
import 'package:life_track/widgets/custom_success_dialog.dart';
import 'package:sizer/sizer.dart';

import '../../constants/color_constants.dart';
import '../../constants/constants_widgets.dart';
import '../../controllers/image_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class CreateNewPinScreen extends StatelessWidget {
  CreateNewPinScreen({super.key});
  final ImageController imageController = Get.find<ImageController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageController.newpinBg, // Fixed here
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
                  text: 'Create a New PIN',
                  fontSize: 22.sp,
                  color: whiteColor,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -1
                ),
                SizedBox(height: 0.4.h,),
                customText(
                  text: 'Please create a new PIN for your account',
                  fontSize: 15.sp,
                  color: whiteColor,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.1
                ),
                SizedBox(height: 3.5.h,),
                customPinField(context: context),
                //SizedBox(height: 4.h,),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    customText(
                      text: 'Resending in 00:50',
                      color: Colors.white,
                      height: 0,
                      fontSize: 14.5.sp,
                    ),
                    Spacer(),
                    InkWell(
                      onTap: (){
                        //Get.toNamed('/forget');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          customText(
                            text: 'Resend Code',
                            color: Colors.white,
                            height: 0,
                            fontSize: 14.5.sp,
                          ),
                          Container(
                            height: 0.15.h,
                            width: 20.w,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.5.h,),
                customButton('Update', ontap: (){
                  //Get.toNamed('/verification');
                  showDialog(context: context, builder: (_) => successDialog('PIN Updated Successfully. Please log\n                    in to continue', ontap: (){
                    Get.toNamed('/login');
                  }));
                })
              ],
            ),
          ),
        )
    );
  }
}
