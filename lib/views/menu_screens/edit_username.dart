import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_track/widgets/custom_button.dart';
import 'package:life_track/widgets/custom_header.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants_widgets.dart';
import '../../controllers/image_controller.dart';
import '../../widgets/custom_textfield.dart';

class EditUsername extends StatelessWidget {
  EditUsername({super.key});
  final ImageController imageController = Get.find<ImageController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageController.edit_username,
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5.h,),
              customHeader('Edit Username'),
              SizedBox(height: 3.h,),
              customTextField('Username', 'Alex Smith'),
              SizedBox(height: 1.5.h,),
              customText(
                  text: '3-15 Characters. Cannot include special characters',
                  color: Colors.white,
                  fontSize: 15.sp
              ),
              Spacer(),
              customButton('Save & Update', ontap: (){
                Get.back();
              }),
              SizedBox(height: 6.h,),
            ],
          ),
        ),
      ),
    );
  }
}
