import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'image_controller.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final ImageController imageController = Get.find<ImageController>();

  var currentPage = 0.obs;
  late final List<Map<String, dynamic>> onboardingData;



  @override
  void onInit() {
    super.onInit();

    onboardingData = [
      {
        'image': imageController.onboarding1Bg,
        'title': 'Biking on Mountain',
        'desc': 'Log in / Sign up to get interested rewards on your hard works',
      },
      {
        'image': imageController.onboarding2Bg,
        'title': 'Kayaking surfing',
        'desc': 'Log in / Sign up to get interested rewards on your hard works',
      },
    ];
  }


// THIS IS THE FIX
  @override
  void onReady() {
    super.onReady();
    _init();     // now context is available!
  }

  Future<void> _init() async {
    final context = Get.context!;
    await imageController.preloadImages(context);
  }


  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < onboardingData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void redirectToSignup() {
    Get.offNamed('/signup'); // Navigate to signup
  }

  void skipToLastPage() {
    pageController.jumpToPage(onboardingData.length - 1);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
