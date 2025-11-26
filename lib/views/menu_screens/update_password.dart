import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_track/controllers/auth_controller.dart';
import 'package:life_track/widgets/custom_button.dart';
import 'package:life_track/widgets/custom_header.dart';
import 'package:sizer/sizer.dart';

import '../../constants/color_constants.dart';
import '../../constants/constants_widgets.dart';
import '../../controllers/image_controller.dart';
import '../dashboard_screens/profile_screen.dart';

class UpdatePassword extends StatelessWidget {
  UpdatePassword({super.key});

  final ImageController imageController = Get.find<ImageController>();
  final AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageController.updatepass,
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              SizedBox(height: 5.h),
              customHeader('Update Password'),
              SizedBox(height: 3.h),

              // ✔ New password field
              Obx(() => updatePasswordTextfield(
                title: "New Password",
                hintText: "********",
                value: controller.newPassword.value,
                obscure: controller.newPassObscure.value,
                onChanged: (val) => controller.newPassword.value = val,
                onToggle: () => controller.newPassObscure.toggle(),
                showCheck: controller.hasMinLength &&
                    controller.hasLetter &&
                    controller.hasNumber,
              )),

              SizedBox(height: 1.h),

              // 🔥 Strength + Validation
              Obx(() => blurContainer(
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 4.w, vertical: 1.h),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          customText(
                              text: 'Your Password Must Include',
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                          const Spacer(),
                          customText(
                            text: controller.strength,
                            fontSize: 15.sp,
                            color: controller.strengthColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      SizedBox(height: 0.5.h),
                      validation(
                        "At least 8 characters",
                        controller.hasMinLength,
                      ),
                      validation(
                        "At least one letter",
                        controller.hasLetter,
                      ),
                      validation(
                        "At least one number",
                        controller.hasNumber,
                      ),
                    ],
                  ),
                ),
              )),

              SizedBox(height: 2.h),

              // ✔ Confirm password
              Obx(() => updatePasswordTextfield(
                title: "Confirm Password",
                hintText: "********",
                value: controller.confirmPassword.value,
                obscure: controller.confirmPassObscure.value,
                onChanged: (val) => controller.confirmPassword.value = val,
                onToggle: () => controller.confirmPassObscure.toggle(),
                showCheck: controller.passwordsMatch,
              )),
              Spacer(),
              customButton('Save & Update', ontap: (){Get.back();}),
              SizedBox(height: 6.h,)
            ],
          ),
        ),
      ),
    );
  }
}
Widget updatePasswordTextfield({
  required String title,
  required String hintText,
  required String value,
  required bool obscure,
  required Function(String) onChanged,
  required VoidCallback onToggle,
  bool showCheck = false,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(12.sp),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.sp),
              color: whiteColor.withOpacity(0.2),
              border: Border.all(color: Colors.white.withOpacity(0.3)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(
                          text: title,
                          color: whiteColor,
                          fontSize: 14.5.sp,
                        ),
                        TextField(
                          obscureText: obscure,
                          onChanged: onChanged,
                          decoration: InputDecoration(
                            hintText: hintText,
                            hintStyle: TextStyle(
                                color: whiteColor.withOpacity(0.7),
                                fontSize: 15.5.sp),
                            border: InputBorder.none,
                            isDense: true,
                          ),
                          style: TextStyle(
                              color: whiteColor,
                              fontSize: 15.5.sp),
                        ),
                      ],
                    ),
                  ),

                  // ✔ Green check icon
                  if (showCheck)
                    Icon(Icons.check_circle, color: buttonColor),

                  SizedBox(width: 2.w),

                  // 👁 Toggle visibility
                  GestureDetector(
                    onTap: onToggle,
                    child: Icon(
                      obscure
                          ? Icons.visibility_off_outlined
                          : Icons.remove_red_eye_outlined,
                      color: Colors.white,
                      size: 18.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
Widget validation(String title, bool valid) {
  return Row(
    children: [
      Icon(
        Icons.check_circle,
        color: valid ? buttonColor : Colors.white.withOpacity(0.3),
        size: 16.sp,
      ),
      SizedBox(width: 1.w),
      customText(
        text: title,
        fontSize: 14.sp,
        color: valid ? Colors.white : Colors.white.withOpacity(0.5),
      ),
    ],
  );
}
