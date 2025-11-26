import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_track/constants/constants_widgets.dart';
import 'package:life_track/controllers/image_controller.dart';
import 'package:life_track/controllers/onboarding_controller.dart';
import 'package:sizer/sizer.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingController = Get.put(OnboardingController());

    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: onboardingController.pageController,
        onPageChanged: onboardingController.onPageChanged,
        itemCount: onboardingController.onboardingData.length,
        itemBuilder: (context, index) {
          final item = onboardingController.onboardingData[index];

          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: item["image"],
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/images/icons/filter.png',
                        width: 7.5.w,
                      )
                    ],
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/images/icons/onboarding_icon.png',
                    width: 15.w,
                  ),
                  SizedBox(height: 1.h),
                  customText(
                    text: item['title']!,
                    fontFamily: 'redditsans',
                    color: Colors.white,
                    fontSize: 23.5.sp,
                    fontWeight: FontWeight.w700,

                  ),
                  SizedBox(height: 0.7.h),
                  customText(
                    text: item['desc']!,
                    fontFamily: 'redditsans',
                    color: Colors.white,
                    fontSize: 15.5.sp,
                    fontWeight: FontWeight.w400,
                    maxLines: null,
                    softWrap: true,
                    overFlow: TextOverflow.visible
                  ),
                  SizedBox(height: 4.h),
                  // Only this part depends on currentPage
                  Obx(() {
                    final isLastPage = onboardingController.currentPage.value ==
                        onboardingController.onboardingData.length - 1;

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (!isLastPage)
                          InkWell(
                            onTap: onboardingController.nextPage,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                color: Colors.grey.withValues(alpha: 0.01),
                                shape: BoxShape.circle
                              ),
                              child: Image.asset(
                                'assets/images/icons/arrow_down.png',
                                width: 5.w,
                              ),
                            ),
                          )
                        else
                          InkWell(
                            onTap: onboardingController.redirectToSignup,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                  color: Colors.grey.withValues(alpha: 0.01),
                                  shape: BoxShape.circle
                              ),
                              child: Image.asset(
                                'assets/images/icons/arrow_down.png',
                                width: 5.w,
                              ),
                            ),
                          )
                      ],
                    );
                  }),
                  SizedBox(height: 4.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
