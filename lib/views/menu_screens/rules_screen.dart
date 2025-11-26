import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_track/constants/constants_widgets.dart';
import 'package:life_track/views/dashboard_screens/home_screen.dart';
import 'package:life_track/views/dashboard_screens/profile_screen.dart';
import 'package:life_track/widgets/custom_header.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/image_controller.dart';

class RulesScreen extends StatelessWidget {
  RulesScreen({super.key});
  final ImageController imageController = Get.find<ImageController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageController.rules,
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 4.w,),
        child: Column(
            children: [
              SizedBox(height: 5.h,),
              customHeader('Rules'),
              SizedBox(height: 3.h,),
                  customRules('assets/images/icons/rule1.png', 'Rules: No data manipulation. Violations = suspension'),
                  SizedBox(height: 1.h,),
                  customRules('assets/images/icons/rule2.png', 'Report Misuse: Anonymous reporting (+50 bonus pts for verified reports).'),

          ],
        ),
        ),
      ),
    );
  }
}
Widget customRules(String path, String title){
  return SizedBox(
    height: 25.h,
    child: blurContainer(
      Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(path, width: 10.w,),
            SizedBox(height: 2.h,),
            customText(
                textAlign: TextAlign.center,
                text: title,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                maxLines: 3,
                softWrap: true,
                overFlow: TextOverflow.visible,
                height: 1.1
            )
          ],
        ),
      ),
      isBorder: false,
    ),
  );
}