import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_track/constants/color_constants.dart';
import 'package:life_track/widgets/custom_button.dart';
import 'package:life_track/widgets/custom_textfield.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/contact_no_controller.dart';
import '../../controllers/image_controller.dart';
import '../../widgets/custom_header.dart';
import '../../widgets/custom_phonefield.dart';

class EditContact extends StatelessWidget {
  final ImageController imageController = Get.find<ImageController>();
  final ContactController controller = Get.put(ContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageController.edit_contact,
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              SizedBox(height: 5.h),
              customHeader('Contact Details'),
              SizedBox(height: 3.h),

              // Phone
              Obx(()=>
                SizedBox(
                  height: 7.h,
                  child: CustomPhoneField(
                    hintText: '0123 456 7890',
                    onChanged: controller.updatePhone,
                    isCheck: controller.isPhoneValid,
                  ),
                ),
              ),
              SizedBox(height: 1.5.h),

              // Email
              Stack(
                children: [
                  // TextField
                  customTextField(
                    '',
                    'Enter Your Email Address',
                    isTitle: false,
                    onChanged: controller.updateEmail,   // update value in controller
                  ),

                  // Reactive check icon
                  Obx(() =>
                  controller.isEmailValid.value
                      ? Positioned(
                    top: 0,
                    bottom: 0,
                    right: 4.w,
                    child: Icon(Icons.check_circle, color: buttonColor),
                  )
                      : SizedBox.shrink(),
                  ),
                ],
              ),

              Spacer(),
              customButton('Save & Update', ontap: (){
                Get.back();
              }),
              SizedBox(height: 6.h)
            ],
          ),
        ),
      ),
    );
  }
}

