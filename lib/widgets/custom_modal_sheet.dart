import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constants/color_constants.dart';
import '../constants/constants_widgets.dart';

void openBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent, // keep glass effect
    isScrollControlled: true, // important to move sheet with keyboard
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom, // pushes sheet up
        ),
        child: Container(
          width: double.infinity,
          height: 38.h, // your original height
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.sp),
              topRight: Radius.circular(15.sp),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.sp),
                    topRight: Radius.circular(15.sp),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.8.h), // original
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w), // original
                        child: Row(
                          children: [
                            customText(
                              text: 'New Post',
                              color: Colors.white,
                              fontSize: 18.5.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(Icons.close, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 0.3.h),
                      Divider(
                        color: Colors.white.withOpacity(0.3),
                      ),
                      SizedBox(height: 0.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w), // original
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 1.5.h),
                                Image.asset(
                                  'assets/images/png/person1.png',
                                  width: 13.w,
                                ),
                              ],
                            ),
                            SizedBox(width: 3.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 1.6.h),
                                  customText(
                                    text: 'Alex Smith',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17.sp,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 0.5.h),
                                  TextField(
                                    style: TextStyle(
                                      color: Colors.white, // typed text color
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    maxLines: null, // multi-line
                                    keyboardType: TextInputType.multiline,
                                    decoration: InputDecoration(
                                      hintText:
                                      'Drop your shoutout post right here! Looking forward to seeing what you want to share!',
                                      hintStyle: TextStyle(
                                        color: whiteColor.withOpacity(0.6),
                                        fontSize: 15.sp,
                                      ),
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.zero,
                                      isDense: true,
                                    ),
                                  ),
                                  SizedBox(height: 2.h),
                                  Row(
                                    children: [
                                      Image.asset(
                                          'assets/images/png/gallery.png',
                                          width: 4.2.w),
                                      SizedBox(width: 4.w),
                                      Image.asset(
                                          'assets/images/png/camera.png',
                                          width: 4.8.w),
                                      SizedBox(width: 4.w),
                                      Image.asset(
                                          'assets/images/png/gif.png',
                                          width: 4.2.w),
                                      SizedBox(width: 4.w),
                                      Image.asset(
                                          'assets/images/png/hash.png',
                                          width: 4.2.w),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w), // original
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.earth,
                              color: Colors.white,
                              size: 17.sp,
                            ),
                            SizedBox(width: 2.w),
                            customText(
                              text: 'Anyone can reply',
                              fontSize: 15.sp,
                              color: Colors.white,
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.w, vertical: 0.4.h),
                              decoration: BoxDecoration(
                                color: buttonColor,
                                borderRadius: BorderRadius.circular(20.sp),
                              ),
                              child: customText(
                                text: 'Post',
                                fontSize: 15.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
