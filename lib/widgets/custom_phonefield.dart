import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:get/get.dart';
import 'package:life_track/constants/color_constants.dart';
import 'package:sizer/sizer.dart';

import '../constants/constants_widgets.dart';

class CustomPhoneField extends StatefulWidget {
  final String hintText;
  final Function(String)? onChanged;

  final RxBool isCheck;

  const CustomPhoneField({
    super.key,
    required this.hintText,
    this.onChanged,
    required this.isCheck,
  });

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  Country selectedCountry = Country(
    countryCode: "PK",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "Pakistan",
    example: "3001234567",
    displayName: "Pakistan",
    displayNameNoCountryCode: "Pakistan",
    e164Key: "", phoneCode: '',
  );

  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.sp),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15), // adjust blur
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2), // translucent background
            borderRadius: BorderRadius.circular(12.sp),
          ),
          child: Obx(()=>
            Row(
              children: [
                // Country picker
                InkWell(
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      showPhoneCode: true,
                      onSelect: (Country country) {
                        setState(() {
                          selectedCountry = country;
                        });
                      },
                    );
                  },
                  child: Row(
                    children: [
                      customText(text: selectedCountry.flagEmoji,fontSize: 20.sp),
                      SizedBox(width: 2.w),
                      customText(
                        text: "+${selectedCountry.phoneCode}",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.8),
                      ),
                      SizedBox(width: 2.w),
                      const Icon(Icons.keyboard_arrow_down, color: Colors.white70),
                    ],
                  ),
                ),

                SizedBox(width: 3.w),

                // Phone number input
                Expanded(
                  child: TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 15.sp),
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 15.sp),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                    onChanged: widget.onChanged,
                  ),
                ),
                if(widget.isCheck.value == true)
                Icon(Icons.check_circle, color: buttonColor,),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
