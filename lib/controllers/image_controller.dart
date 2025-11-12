import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BgImages {
  static const AssetImage onboarding1 =
  AssetImage('assets/images/background/onboarding1.png');
  static const AssetImage onboarding2 =
  AssetImage('assets/images/background/onboarding2.png');
  static const AssetImage signup =
  AssetImage('assets/images/background/signup_bg.png');
  static const AssetImage login =
  AssetImage('assets/images/background/login_bg.png');
  static const AssetImage forget =
  AssetImage('assets/images/background/forget_bg.png');
  static const AssetImage verification =
  AssetImage('assets/images/background/verification_bg.png');
  static const AssetImage newpin =
  AssetImage('assets/images/background/newpin_bg.png');
  static const AssetImage preferredsports =
  AssetImage('assets/images/background/preferredsports_bg.png');
  static const AssetImage getnotified =
  AssetImage('assets/images/background/getnotified_bg.png');
}

class ImageController extends GetxController {
  // Store loaded images reactively (optional)
  final RxList<AssetImage> loadedImages = <AssetImage>[].obs;
  var isLoaded = false.obs;

  final List<AssetImage> images = [
    BgImages.signup,
    BgImages.login,
    BgImages.forget,
    BgImages.verification,
    BgImages.newpin,
    BgImages.onboarding1,
    BgImages.onboarding2,
    BgImages.preferredsports,
    BgImages.getnotified,
  ];

  /// Async method to preload images
  Future<void> preloadImages(BuildContext context) async {
    await Future.wait(images.map((img) {
      return precacheImage(img, context).then((_) => loadedImages.add(img));
    }));
    isLoaded.value = true; // mark all images as loaded

  }

  // Getters for direct use
  AssetImage get onboarding1Bg => BgImages.onboarding1;
  AssetImage get onboarding2Bg => BgImages.onboarding2;
  AssetImage get signupBg => BgImages.signup;
  AssetImage get loginBg => BgImages.login;
  AssetImage get forgetBg => BgImages.forget;
  AssetImage get verificationBg => BgImages.verification;
  AssetImage get newpinBg => BgImages.newpin;
  AssetImage get preferredsports => BgImages.preferredsports;
  AssetImage get getnotified => BgImages.getnotified;
}
