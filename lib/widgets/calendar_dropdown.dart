import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CalendarDropdown extends StatelessWidget {
  final String value;
  final List<String> items;
  final Function(String?) onChanged;

  const CalendarDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.sp),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12.sp),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,

              // 🔥 Removes internal padding & spacing
              isDense: true,
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.white,
                size: 16.sp,
              ),

              dropdownColor: Colors.black87,

              // Text style inside the dropdown button
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.5.sp,
              ),

              onChanged: onChanged,

              items: items.map((String item) {
                return DropdownMenuItem(
                  value: item,

                  // 🔥 Removes the internal padding from menu items
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: Text(
                      item,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.5.sp,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
