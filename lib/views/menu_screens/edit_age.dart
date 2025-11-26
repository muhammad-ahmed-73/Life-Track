import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_track/constants/constants_widgets.dart';
import 'package:life_track/controllers/calendar_controller.dart';
import 'package:life_track/widgets/custom_button.dart';
import 'package:life_track/widgets/custom_textfield.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/image_controller.dart';
import '../../widgets/calendar_dropdown.dart';
import '../../widgets/custom_header.dart';

class EditAge extends StatelessWidget {
  EditAge({super.key});
  final ImageController imageController = Get.find<ImageController>();
  final CalendarController calendarController = Get.put(CalendarController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageController.activity,
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          children: [
            SizedBox(height: 5.h,),
            customHeader('Age'),
            SizedBox(height: 3.5.h,),
          customText(
              text: 'Your age is never shared publicly, it’s only app personalization.',
              color: Colors.white,
              fontSize: 15.sp,
            maxLines: null,
            softWrap: true,
            overFlow: TextOverflow.visible
          ),
            SizedBox(height: 2.5.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Obx(() => CalendarDropdown(
                    value: calendarController.selectedDay.value,
                    items: calendarController.daysList,
                    onChanged: (val) => calendarController.selectedDay.value = val!,
                  ))

                ),
                SizedBox(width: 3.w),

                Expanded(
                  child: Obx(() => CalendarDropdown(
                    value: calendarController.selectedMonth.value,
                    items: calendarController.monthsList,
                    onChanged: (val) => calendarController.changeMonth(val!),
                  ))

                ),
                SizedBox(width: 3.w),

                Expanded(
                  child: Obx(() => CalendarDropdown(
                    value: calendarController.selectedYear.value,
                    items: calendarController.yearsList,
                    onChanged: (val) => calendarController.changeYear(val!),
                  ))

                ),
              ],
            ),
            Spacer(),
            customButton('Save & Update', ontap: (){
              Get.back();
            }),
            SizedBox(height: 6.h,)
          ],
        ),
        ),
      ),
    );
  }
}
