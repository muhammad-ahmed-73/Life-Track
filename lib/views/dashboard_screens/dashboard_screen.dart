import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_track/constants/color_constants.dart';
import 'package:life_track/constants/constants_widgets.dart';
import 'package:sizer/sizer.dart';
import '../../controllers/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final DashboardController controller = Get.find<DashboardController>();

  // Custom navigation item
  Widget buildNavItem({
    required String iconPath,
    required String label,
    required int index,
  }) {
    final bool isSelected = controller.selectedIndex.value == index;

    return InkWell(
      onTap: () => controller.onTabTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        padding: EdgeInsets.symmetric(horizontal: 4.w,),
        decoration: BoxDecoration(
          color: isSelected ? buttonColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: isSelected ? 6.w : 5.5.w,
              // height: 5.5.w,
              child: Image.asset(
                iconPath,
                color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.7),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 0.5.h),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: customText(
                text: label,
                fontSize: 13.5.sp, // slightly reduced to prevent overflow
                fontWeight:
                isSelected ? FontWeight.w700 : FontWeight.normal,
                color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        extendBody: true,
        body: IndexedStack(
        index: controller.selectedIndex.value,
        children: controller.pages.map((pageBuilder) => pageBuilder()).toList(),
      ),


      bottomNavigationBar: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX:15, sigmaY: 15),
            child: Container(
              height: 10.5.h, // smaller, safer height
              padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 1.5.h, bottom: 2.h), // remove vertical padding
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2), // glossy effect
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildNavItem(iconPath: 'assets/images/navbar_icons/home.png', label: 'Home', index: 0),
                  buildNavItem(iconPath: 'assets/images/navbar_icons/activity.png', label: 'Activity', index: 1),
                  buildNavItem(iconPath: 'assets/images/navbar_icons/events.png', label: 'Events', index: 2),
                  buildNavItem(iconPath: 'assets/images/navbar_icons/community.png', label: 'Community', index: 3),
                  buildNavItem(iconPath: 'assets/images/navbar_icons/profile.png', label: 'My Profile', index: 4),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
