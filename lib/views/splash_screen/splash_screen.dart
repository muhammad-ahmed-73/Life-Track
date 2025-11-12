import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_track/constants/constants_widgets.dart';
import 'package:life_track/controllers/splash_controller.dart';
import 'package:sizer/sizer.dart';
import '../../constants/color_constants.dart'; // Make sure path is correct

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controller
    final SplashController splashController = Get.put(SplashController('/onboarding'));


    return Scaffold(
      backgroundColor: splashColor,
      body: Stack(
        children: [
          // Top circular opacity
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: double.infinity,
              height: 35.h,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.topCenter,
                  radius: 1.4,
                  colors: [
                    Colors.white.withOpacity(0.15),
                    Colors.transparent,
                  ],
                  stops: [0, 1],
                ),
              ),
            ),
          ),

          // Bottom circular opacity
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 35.h,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.bottomCenter,
                  radius: 1.4,
                  colors: [
                    Colors.white.withOpacity(0.15),
                    Colors.transparent,
                  ],
                  stops: [0, 1],
                ),
              ),
            ),
          ),

          // Center content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // customText(
                //   text: 'Splash Screen Animation',
                //   color: Colors.white,
                //   fontSize: 20,
                //   fontWeight: FontWeight.bold,
                // ),
                Image.asset('assets/images/png/logo.png', width: 55.w,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
