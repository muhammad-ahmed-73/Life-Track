import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_track/controllers/preferred_controller.dart';
import 'package:life_track/widgets/custom_header.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants_widgets.dart';
import '../../controllers/image_controller.dart';
import '../../widgets/custom_button.dart';
import '../dashboard_screens/preferredsprots_screen.dart';

class PreferredScreen extends StatelessWidget {
  PreferredScreen({super.key});
  final ImageController imageController = Get.find<ImageController>();
  final PreferredController preferredController = Get.find<PreferredController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageController.preferred,
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.h,),
            customHeader('Preferred Activity'),
            SizedBox(height: 3.h,),
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
              children: List.generate(preferredController.optionsData.length, (index){
                return options(preferredController.optionsData[index]['image']!, preferredController.optionsData[index]['label']!);
              }),
            ),
            Spacer(),
            customButton('Save & Update', ontap: () => Get.back(), isImage: false),
            SizedBox(height: 6.h,),

          ],
        ),
        ),
      ),
    );
  }
}
