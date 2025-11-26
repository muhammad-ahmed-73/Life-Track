import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:life_track/constants/constants_widgets.dart';
import 'package:life_track/controllers/image_controller.dart';
import 'package:life_track/views/dashboard_screens/profile_screen.dart';
import 'package:sizer/sizer.dart';

import '../../constants/color_constants.dart';
import '../../widgets/custom_modal_sheet.dart';

class CommunityScreen extends StatelessWidget {
  CommunityScreen({super.key});
  final ImageController imageController = Get.find<ImageController>();
  List<Map<String, String>> comments = [
    {
      "path": "assets/images/png/person2.png",
      "name": "Elsa Gibson",
      "desc":
          "Lorem ipsum dolor sit amet consectetur. Viverra tellus eget mag na sapien.",
      "likes": "12k likes",
    },
    {
      "path": "assets/images/png/person1.png",
      "name": "Lynn Richie",
      "desc":
          "Lorem ipsum dolor sit amet consectetur. Viverra tellus eget mag na sapien.",
      "likes": "12k likes",
    },
    {
      "path": "assets/images/png/person2.png",
      "name": "Rita Armstrong",
      "desc":
          "Lorem ipsum dolor sit amet consectetur. Viverra tellus eget mag na sapien.",
      "likes": "12k likes",
    },
    {
      "path": "assets/images/png/person3.png",
      "name": "Daniel Hamill",
      "desc":
          "Lorem ipsum dolor sit amet consectetur. Viverra tellus eget mag na sapien.",
      "likes": "12k likes",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageController.community,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Fixed AppBar
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(
                        text: 'Good Morning!',
                        fontSize: 20.5.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        height: 0,
                        letterSpacing: -0.2,
                      ),
                      customText(
                        text: 'Alex Smith',
                        fontSize: 17.5.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        height: 0,
                        letterSpacing: -0.2,
                      ),
                    ],
                  ),
                  Spacer(),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      InkWell(
                        onTap: (){
                          Get.toNamed('/notification');
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 3.w,
                            vertical: 1.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.notifications_none_outlined,
                            color: Colors.white,
                            size: 20.5.sp,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 1.4.h,
                        right: 3.5.w,
                        child: Container(
                          height: 0.8.h,
                          width: 2.w,
                          decoration: BoxDecoration(
                            color: statusColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // "Community" title
            SizedBox(height: 2.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: customText(
                text: 'Community',
                fontSize: 17.5.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                height: 0,
                letterSpacing: -0.2,
              ),
            ),
            SizedBox(height: 1.5.h),
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(
                  children: [
                    // Main Post
                    post(
                      'assets/images/png/person1.png',
                      'Alex Smith',
                      'Lorem ipsum dolor sit amet consectetur. Viverra tellus eget magna sapien. Faucibus nibh mauris mattis aliquam proin pellentesque sed done. Nulla sed consequat scelerisque.',
                      '12k likes',
                    ),
                    SizedBox(height: 1.5.h),
                    // Comments
                    ...comments.map(
                      (item) => post(
                        item['path']!,
                        item['name']!,
                        item['desc']!,
                        item['likes']!,
                        isComment: true,
                      ),
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 11.h), // Moves FAB above navbar
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: statusColor
          ),
          child: FloatingActionButton(
            onPressed: () {openBottomSheet(context);},
            backgroundColor: Colors.transparent, // remove default color if needed
            elevation: 0,
            child: Image.asset('assets/images/icons/fab_community_icon.png', width: 5.w,),
          ),
        ),
      ),
    );
  }
}

Widget post(
  String path,
  String name,
  String desc,
  String likes, {
  bool? isComment = false,
}) {
  return Stack(
    children: [
      Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 6.h,
                width: 10.5.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage(path)),
                ),
              ),
              SizedBox(width: 2.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(
                    text: name,
                    fontSize: 17.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  customText(
                    text: '2hrs Ago',
                    fontSize: 13.sp,
                    color: Colors.white.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              Spacer(),
              Icon(
                FontAwesomeIcons.ellipsis,
                color: Colors.white,
                size: 16.5.sp,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                isComment == false
                    ? RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "$desc ",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'redditsans',
                              ),
                            ),
                            TextSpan(
                              text: "\nRead More",
                              style: TextStyle(
                                fontSize: 13.5.sp,
                                fontFamily: 'redditsans',
                                color: buttonColor,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                              ),
                              // recognizer: TapGestureRecognizer()..onTap = () {
                              // open full text
                              //},
                            ),
                          ],
                        ),
                      )
                    : customText(
                        text: desc,
                        fontSize: 14.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        maxLines: null,
                      ),
                SizedBox(height: 1.25.h),
                isComment == false
                    ? Image.asset('assets/images/png/post.png')
                    : SizedBox.shrink(),
                isComment == false
                    ? SizedBox(height: 1.25.h)
                    : SizedBox.shrink(),

                isComment == false
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 2.5.h,
                            width: 6.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/png/person3.png',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Column(
                            children: [
                              customText(
                                text: '8 Replies',
                                color: Colors.white,
                                fontSize: 14.sp,
                                height: 0,
                                letterSpacing: -0.4,
                              ),
                              Container(
                                width: 11.5.w,
                                height: 0.1.h,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.7),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 1.5.w),
                          Icon(Icons.circle, color: Colors.white, size: 8.sp),
                          SizedBox(width: 1.5.w),
                          customText(
                            text: '12k Likes',
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: -0.4,
                          ),
                          SizedBox(width: 4.w),
                          Icon(
                            FontAwesomeIcons.heart,
                            color: Colors.white,
                            size: 18.5.sp,
                            fontWeight: FontWeight.w100,
                          ),
                          SizedBox(width: 4.w),
                          Icon(
                            FontAwesomeIcons.comment,
                            color: Colors.white,
                            size: 18.sp,
                            fontWeight: FontWeight.w100,
                          ),
                          SizedBox(width: 4.w),
                          Icon(
                            FontAwesomeIcons.repeat,
                            color: Colors.white,
                            size: 18.sp,
                            fontWeight: FontWeight.w100,
                          ),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          customText(
                            text: '12k Likes',
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: -0.4,
                          ),
                          SizedBox(width: 4.w),
                          Icon(
                            FontAwesomeIcons.heart,
                            color: Colors.white,
                            size: 18.5.sp,
                            fontWeight: FontWeight.w100,
                          ),
                          SizedBox(width: 4.w),
                          Icon(
                            FontAwesomeIcons.comment,
                            color: Colors.white,
                            size: 18.sp,
                            fontWeight: FontWeight.w100,
                          ),
                          SizedBox(width: 4.w),
                          Icon(
                            FontAwesomeIcons.repeat,
                            color: Colors.white,
                            size: 18.sp,
                            fontWeight: FontWeight.w100,
                          ),
                        ],
                      ),
              ],
            ),
          ),
          isComment == false
              ? SizedBox.shrink()
              : Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.5.h),
                  child: Divider(color: Colors.white.withValues(alpha: 0.2)),
                ),
        ],
      ),
      isComment == true ? SizedBox.shrink() : Positioned(
          top: 7.h,
          child: Image.asset('assets/images/png/comment_string.png',height: 31.h, width: 5.w, color: Colors.white,))
    ],
  );
}

