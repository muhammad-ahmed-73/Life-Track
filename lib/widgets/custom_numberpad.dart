import 'package:flutter/material.dart';
import 'package:life_track/constants/constants_widgets.dart';
import 'package:sizer/sizer.dart';

Widget customNumberPad({
  required Function(String) onNumberTap,
  required VoidCallback onBackspace,
}) {
  final keys = [
    ['1', ''],
    ['2', 'ABC'],
    ['3', 'DEF'],
    ['4', 'GHI'],
    ['5', 'JKL'],
    ['6', 'MNO'],
    ['7', 'PQRS'],
    ['8', 'TUV'],
    ['9', 'WXYZ'],
  ];

  return Container(
    padding: EdgeInsets.only(bottom: 7.h, top: 1.h),
    color: Color(0xFF151515),
    child: Column(
      children: [
        Wrap(
          spacing: 2.w,
          runSpacing: 1.h,
          alignment: WrapAlignment.center,
          children: keys.map((item) {
            return Container(
              height: 5.h,
              width: 30.w,
              decoration: BoxDecoration(
                color: Color(0xFF6F6F70),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customText(
                    text: item[0],
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    height: 1
                  ),
                  if (item[1].isNotEmpty)
                    customText(
                      text: item[1],
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      height: 1
                    ),
                ],
              ),
            ).onTap(() => onNumberTap(item[0]));
          }).toList(),
        ),

        SizedBox(height: 1.h),

        Padding(
          padding: EdgeInsets.only(left: 14.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 0 BUTTON
              Container(
                height: 5.5.h,
                width: 30.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: customText(
                  text: "0",
                    color: Colors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                ),
              ).onTap(() => onNumberTap("0")),

              SizedBox(width: 4.w),

              // BACKSPACE BUTTON
              Container(
                height: 5.5.h,
                width: 10.w,
                decoration: BoxDecoration(
                  //color: Colors.grey.shade700,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.backspace_outlined, color: Colors.white),
              ).onTap(onBackspace),
            ],
          ),
        ),
      ],
    ),
  );
}

extension OnTapExtension on Widget {
  Widget onTap(VoidCallback onTap) {
    return GestureDetector(onTap: onTap, child: this);
  }
}
