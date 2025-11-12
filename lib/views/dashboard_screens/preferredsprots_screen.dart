import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:life_track/controllers/image_controller.dart';
import 'package:life_track/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

import '../../constants/color_constants.dart';
import '../../constants/constants_widgets.dart';

class PreferredsprotsScreen extends StatelessWidget {
  PreferredsprotsScreen({super.key});

  final ImageController imageController = Get.find<ImageController>();
  List<Map<String, String>> optionsData = [
    {'image': 'assets/images/preferred/Bicycle.png', 'label': 'Biking'},
    {'image': 'assets/images/preferred/Bicycle1.png', 'label': 'Biking - Off Road'},
    {'image': 'assets/images/preferred/Swimmer.png', 'label': 'Swimming'},
    {'image': 'assets/images/preferred/Paddle surf.png', 'label': 'Paddle Boarding'},
    {'image': 'assets/images/preferred/Windsurfing.png', 'label': 'Wind Surfing'},
    {'image': 'assets/images/preferred/Kitesurf.png', 'label': 'Kite Boarding'},
    {'image': 'assets/images/preferred/Kayak.png', 'label': 'Kayaking'},
    {'image': 'assets/images/preferred/Run.png', 'label': 'Running'},
    {'image': 'assets/images/preferred/Snowboard.png', 'label': 'Cross Country Skiing'},
    // Add more as needed
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageController.preferredsports, // Fixed here
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.h,),
              Row(
                children: [
                  InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back_ios_new_rounded, color: whiteColor, fontWeight: FontWeight.w700,))
                ],
              ),
              SizedBox(height: 4.h,),
              customText(
                text: 'Select Your 3+ Preferred Sports',
                color: Colors.white,
                fontSize: 17.sp,
                fontWeight: FontWeight.w600
              ),
              SizedBox(height: 3.h,),
              Wrap(
                spacing: 2.w,
                runSpacing: 1.h,
                children: List.generate(optionsData.length, (index){
                  return options(optionsData[index]['image']!, optionsData[index]['label']!);
                }),
              ),
              SizedBox(height: 7.h,),
              customText(
                text: 'Pick Your Passion,\nPlay Your Way!',
                fontSize: 22.sp,
                color: Colors.white,
                fontWeight: FontWeight.w700,
                height: 0
              ),
              SizedBox(height: 2.h,),
              customText(
                text: 'Pick your favorite sports—earn points, join events, and connect with players who share your passion! ',
                fontSize: 15.sp,
                color: Colors.white
              ),
              SizedBox(height: 4.h,),
              customButton('Continue', ontap: () => Get.toNamed('/getnotified'), isImage: false),
              SizedBox(height: 2.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customText(
                    text: 'Skip',
                    color: Colors.white,
                    fontSize: 16.5.sp
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
Widget options(String path, String title){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.6.h),
    decoration: BoxDecoration(
      color: Colors.white.withValues(alpha: 0.2),
      borderRadius: BorderRadius.circular(25.sp)
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(path, width: 6.5.w,),
        SizedBox(width: 2.w),
        customText(
          text: title,
          color: Colors.white,
          fontSize: 16.sp
        )
      ],
    ),
  );
}