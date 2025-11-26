import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_track/controllers/dashboard_controller.dart';
import 'package:sizer/sizer.dart';

import '../constants/constants_widgets.dart';

Widget customHeader(String title){
  final DashboardController controller = Get.find<DashboardController>();
  return Stack(
    alignment: Alignment.center,
    children: [
      // Left Icon (keeps its position)
      Align(
        alignment: Alignment.centerLeft,
        child: InkWell(
          onTap: (){
            controller.selectedIndex.value == 5 ? controller.selectedIndex.value = 1 : Get.back();
          },
          child: Icon(
            Icons.arrow_back_sharp,
            color: Colors.white,
          ),
        ),
      ),

      // Centered Title
      customText(
        text: title,
        fontSize: 20.sp,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
    ],
  );
}