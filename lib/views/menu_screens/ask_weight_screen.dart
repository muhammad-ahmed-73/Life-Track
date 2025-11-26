import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:life_track/constants/constants_widgets.dart';
import 'package:life_track/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

import '../../constants/color_constants.dart';
import '../../controllers/image_controller.dart';
import '../../controllers/profile_controller.dart';
import '../../widgets/custom_numberpad.dart';

class AskWeightScreen extends StatelessWidget {
  AskWeightScreen({super.key});
  final ImageController imageController = Get.find<ImageController>();
  final ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // disable system keyboard push
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageController.askweight,
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => Get.back(),
                          child: Icon(Icons.arrow_back_ios_new_rounded,
                              color: whiteColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4.h),

                  // Title
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(
                          text: 'Track Your Progress,\nCrush Your Goals!',
                          fontWeight: FontWeight.w700,
                          fontSize: 21.5.sp,
                          color: Colors.white,
                          height: 1,
                        ),
                        SizedBox(height: 1.h),
                        customText(
                          text:
                          'Start strong! Log your weight today and let’s make\nprogress together.',
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp,
                          color: Colors.white.withOpacity(0.8),
                          maxLines: null,
                          height: 0,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 4.h),

                  // Label
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Container(
                      alignment: Alignment.center,
                      height: 5.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.sp),
                        color: statusColor,
                      ),
                      child: customText(
                        text: 'Desired Weight',
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  SizedBox(height: 4.h),

                  // Input row
                  Obx(() {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Minus Button
                          InkWell(
                            onTap: () {
                              int current =
                                  int.tryParse(profileController.weight.value) ??
                                      0;
                              if (current > 0)
                                profileController.weight.value =
                                    (current - 1).toString();
                            },
                            child: Container(
                              height: 6.5.h,
                              width: 6.5.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: buttonColor,
                              ),
                              child: Icon(FontAwesomeIcons.minus,
                                  color: Colors.black, size: 20.sp),
                            ),
                          ),

                          SizedBox(width: 8.w),

                          // Weight Display
                          SizedBox(
                            width: 22.w,
                            child: Center(
                              child: Text(
                                profileController.weight.value,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 26.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(width: 2.w),

                          customText(
                            text: 'LBS',
                            fontWeight: FontWeight.w700,
                            fontSize: 26.sp,
                            color: Colors.white.withOpacity(0.4),
                          ),

                          SizedBox(width: 8.w),

                          // Plus Button
                          InkWell(
                            onTap: () {
                              int current =
                                  int.tryParse(profileController.weight.value) ??
                                      0;
                              profileController.weight.value =
                                  (current + 1).toString();
                            },
                            child: Container(
                              height: 6.5.h,
                              width: 6.5.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: buttonColor,
                              ),
                              child: Icon(FontAwesomeIcons.add,
                                  color: Colors.black, size: 20.sp),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),

                  SizedBox(height: 2.h),

                  // Save & Update Button
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: customButton(
                      'Save & Update',
                      ontap: () {
                        // Add your save logic here
                        Get.snackbar('Saved', 'Weight updated successfully!',
                            backgroundColor: Colors.green, colorText: Colors.white);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ⬇️ NUMERIC KEYBOARD ALWAYS AT BOTTOM
          customNumberPad(
            onNumberTap: (value) {
              if (profileController.weight.value.length < 3) {
                profileController.weight.value += value;
              }
            },
            onBackspace: () {
              if (profileController.weight.value.isNotEmpty) {
                profileController.weight.value = profileController.weight.value
                    .substring(0, profileController.weight.value.length - 1);
              }
            },
          ),
        ],
      ),
    );
  }
}
