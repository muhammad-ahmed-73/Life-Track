import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_track/constants/color_constants.dart';
import 'package:life_track/widgets/custom_header.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants_widgets.dart';
import '../../controllers/image_controller.dart';
import '../../controllers/profile_controller.dart';
import '../dashboard_screens/profile_screen.dart';

class ProfileSetting extends StatelessWidget {
  ProfileSetting({super.key});
  final ProfileController profileController = Get.put(ProfileController());
  final ImageController imageController = Get.find<ImageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageController.profilesetting,
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 5.h),
                customHeader('My Profile Settings'),
                SizedBox(height: 2.h),

                // Profile info
                blurContainer(
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 4.w),
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 10.h,
                              width: 22.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage('assets/images/png/person1.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 1,
                              child: Container(
                                padding: EdgeInsets.all(1.25.w),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 14.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 0.8.h),
                        customText(
                          text: "Alex Smith",
                          fontSize: 16.5.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                        SizedBox(height: 1.5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText(
                                  text: 'Physical Goal',
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 15.sp,
                                  height: 0,
                                ),
                                customText(
                                  text: 'Being In Shape',
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText(
                                  text: 'Age',
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 15.sp,
                                  height: 0,
                                ),
                                customText(
                                  text: '27',
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText(
                                  text: 'Location',
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 15.sp,
                                  height: 0,
                                ),
                                customText(
                                  text: 'New York, NY',
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 1.25.h),

                // Points card
                blurContainer(
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
                    child: InkWell(
                      onTap: (){
                        Get.toNamed('/rewards');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 17.sp),
                              SizedBox(width: 2.w),
                              customText(
                                  text: 'Points',
                                  fontSize: 16.5.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios_rounded,
                                  color: Colors.white, size: 16.sp),
                            ],
                          ),
                          SizedBox(height: 0.2.h),
                          customText(
                            text: 'Note that: 2200pts You have earned Right Now',
                            fontSize: 14.8.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 1.25.h),

                // Options without array
                blurContainer(
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Column(
                      children: [
                        optionButton(
                          'assets/images/icons/EditName.png',
                          'Edit Name',
                          0,
                          profileController,
                          isLast: false,
                          ontap: (){
                            Get.toNamed('/username');
                          }
                        ),
                        optionButton(
                          'assets/images/icons/age.png',
                          'Age',
                          1,
                          profileController,
                          isLast: false,
                            ontap: (){
                              Get.toNamed('/age');
                            }
                        ),
                        optionButton(
                          'assets/images/icons/contact.png',
                          'Contact Details',
                          2,
                          profileController,
                          isLast: false,
                            ontap: (){
                              Get.toNamed('/contact');
                            }
                        ),
                        optionButton(
                          'assets/images/icons/notification.png',
                          'Notifications',
                          3,
                          profileController,
                          isLast: false,
                        ),
                        optionButton(
                          'assets/images/icons/activity.png',
                          'Preffered Activity',
                          4,
                          profileController,
                          isLast: false,
                            ontap: (){
                              Get.toNamed('/preferred');
                            }
                        ),
                        optionButton(
                          'assets/images/icons/goal.png',
                          'My Goal',
                          5,
                          profileController,
                          isLast: false,
                          ontap: (){
                            Get.toNamed('/askweight');
                          }
                        ),
                        optionButton(
                          'assets/images/icons/password.png',
                          'Password',
                          6,
                          profileController,
                          isLast: false,
                            ontap: (){
                              Get.toNamed('/updatepass');
                            }
                        ),
                        optionButton(
                          'assets/images/icons/rules.png',
                          'Rules',
                          7,
                          profileController,
                          isLast: true,
                          ontap: (){
                            Get.toNamed('rules');
                          }
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
Widget optionButton(
    String path,
    String title,
    int index,
    ProfileController controller,
    {bool? isLast = false, VoidCallback? ontap}
    ) {

  return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.8.h),
        child: InkWell(
          onTap: ontap,
          child: Row(
            children: [
              Image.asset(path, width: 4.w),
              SizedBox(width: 3.w),

              customText(
                text: title,
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),

              Spacer(),

              /// 🔵 IF index == 3 → show a working toggle switch
              index == 3
                  ? Obx(() {
                bool value = controller.notificationsOn.value;

                return GestureDetector(
                  onTap: controller.toggleNotifications,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: 8.5.w,
                    height: 2.25.h,
                    padding: EdgeInsets.symmetric(horizontal: 1.w),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade900,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: AnimatedAlign(
                      duration: Duration(milliseconds: 200),
                      alignment: value
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        width: 3.25.w,
                        height: 3.25.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                );
              })
                  : Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16.sp,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),

      isLast == false
          ? Divider(color: Colors.white.withOpacity(0.3))
          : SizedBox.shrink(),
    ],
  );
}

