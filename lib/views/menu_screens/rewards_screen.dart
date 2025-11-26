import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:life_track/views/dashboard_screens/profile_screen.dart';
import 'package:life_track/widgets/custom_header.dart';
import 'package:sizer/sizer.dart';

import '../../constants/color_constants.dart';
import '../../constants/constants_widgets.dart';
import '../../controllers/image_controller.dart';
import '../../controllers/rewards_controller.dart';

class RewardsScreen extends StatelessWidget {
  RewardsScreen({super.key});
  final ImageController imageController = Get.find<ImageController>();
  final RewardsController rewardsController =
  Get.put(RewardsController());
  final List<String> rewardsoptionsArray = [
    'All',
    'Unclaimed',
    'Claimed',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageController.rewards,
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              SizedBox(height: 5.h,),
              customHeader('My Rewards & Milestones'),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 3.h),

                    // Horizontal options list
                    SizedBox(
                      height: 3.4.h,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        scrollDirection: Axis.horizontal,
                        itemCount: rewardsoptionsArray.length,
                        itemBuilder: (context, index) {
                          return rewardsOptions(
                              rewardsoptionsArray[index],
                              ontap: () => rewardsController.updateSelectedIndex(index),
                              index: index);
                        },
                      ),
                    ),
                    SizedBox(height: 1.h,),
                    Divider(color: Colors.white.withValues(alpha: 0.5),),
                    SizedBox(height: 1.h,),
                    rewardsLine('1000 Pts'),
                    SizedBox(height: 1.h,),
                    customRewards('assets/images/png/milestone1.png', '1st Milestone', 'Engraved Athelitic Shirt, Hat, Key Chain, Medallion, 50 Points', 'Claimed!', 0),
                    SizedBox(height: 1.h,),
                    rewardsLine('3000 Pts'),
                    SizedBox(height: 1.h,),
                    customRewards('assets/images/png/milestone2.png', '2nd Milestone', 'Engraved Athelitic Shirt, Hat, Key Chain, Medallion, \$100 Gift Certificate To Local Restaurants', 'Claim Now', 1),
                    SizedBox(height: 1.h,),
                    rewardsLine('10000 Pts'),
                    SizedBox(height: 1.h,),
                    customRewards('assets/images/png/milestone3.png', '3rd Milestone', '1 Week Carribean Cruise For Two, Medallion, 250 Points', 'Need 7800 Pts More', 2),
                    SizedBox(height: 1.h,),
                  ],
                ),
              )
              )
            ],
          ),
        ),
      ),
    );
  }
}
Widget customRewards(String path, String title, String desc, String buttonText, int index) {
  return Container(
    width: double.infinity,
//margin: EdgeInsets.symmetric(vertical: 1.h),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15.sp),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          decoration: BoxDecoration(
            color: index == 1 ? buttonColor:Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15.sp),
            border: Border.all(color: Colors.white.withOpacity(0.35)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.8.h),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 15.h,
                      width: 32.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.sp),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage(path),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: index == 2 ? Icon(Icons.lock, size: 24.sp, color: Colors.white,): SizedBox.shrink()),
                  ],
                ),

                SizedBox(width: 4.w),

                /// 🔥 THIS FIXES THE TEXT WRAPPING
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(
                        text: title,
                        fontSize: 16.5.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      SizedBox(height: 0.5.h),

                      customText(
                        text: desc,
                        fontSize: 14.5.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.9),
                        maxLines: 3,
                        softWrap: true,
                        overFlow: TextOverflow.ellipsis,
                        height: 1.2,
                      ),

                      SizedBox(height: 1.h),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.8.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.sp),
                          color: index == 1
                              ? Colors.black
                              : index == 2
                              ? statusColor
                              : claimedButton.withValues(alpha: 0.5),
                        ),
                        child: index == 1 ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(FontAwesomeIcons.gift, size: 16.sp, color: Colors.amber,),
                            SizedBox(width: 2.w,),
                            customText(
                                text: buttonText,
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500
                            )
                          ],
                        ): customText(
                            text: buttonText,
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500
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
  );

}

Widget rewardsLine(String title) {
  return Row(
    children: [
      customText(
        text: title,
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 18.sp,
      ),
      SizedBox(width: 6.w),

      Expanded(
        child: Divider(
          color: Colors.white.withOpacity(0.4),
          thickness: 1,
        ),
      ),
    ],
  );
}

Widget rewardsOptions(String title, {VoidCallback? ontap, int? index}) {
  final RewardsController rewardsController = Get.find<RewardsController>();

  return Obx(() {
    final isSelected = rewardsController.selectedIndex.value == index;

    return Container(
      margin: EdgeInsets.only(right: 2.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.sp),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: InkWell(
            onTap: ontap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 0.5.h),
              decoration: BoxDecoration(
                color: isSelected ? buttonColor : Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15.sp),
              ),
              child: customText(
                text: title,
                color: isSelected ? Colors.white : Colors.white.withOpacity(0.8),
                fontSize: 15.sp,
              ),
            ),
          ),
        ),
      ),
    );
  });
}

