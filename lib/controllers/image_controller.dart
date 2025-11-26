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
  static const AssetImage home =
  AssetImage('assets/images/background/home_bg.png');
  static const AssetImage activity =
  AssetImage('assets/images/background/activity_bg.png');
  static const AssetImage events =
  AssetImage('assets/images/background/event_bg.png');
  static const AssetImage community =
  AssetImage('assets/images/background/community_bg.png');
  static const AssetImage profile =
  AssetImage('assets/images/background/profile_bg.png');
  static const AssetImage activity_menu =
  AssetImage('assets/images/background/activity_menu_bg.png');
  static const AssetImage boxing =
  AssetImage('assets/images/background/boxing_bg.png');
  static const AssetImage activitysummary =
  AssetImage('assets/images/background/acitivitysummary_bg.png');
  static const AssetImage profilesetting =
  AssetImage('assets/images/background/profile_setting_bg.png');
  static const AssetImage askweight =
  AssetImage('assets/images/background/ask_weight_bg.png');
  static const AssetImage userprofile =
  AssetImage('assets/images/background/userprofile_bg.png');
  static const AssetImage notification =
  AssetImage('assets/images/background/notification_bg.png');
  static const AssetImage rewards =
  AssetImage('assets/images/background/rewards_bg.png');
  static const AssetImage preferred =
  AssetImage('assets/images/background/preferred_bg.png');
  static const AssetImage updatepass =
  AssetImage('assets/images/background/updatepass_bg.png');
  static const AssetImage rules =
  AssetImage('assets/images/background/rules_bg.png');
  static const AssetImage edit_username =
  AssetImage('assets/images/background/edit_username_bg.png');
  static const AssetImage edit_contact =
  AssetImage('assets/images/background/contact_details_bg.png');
  static const AssetImage event_detail =
  AssetImage('assets/images/background/event_detail_bg.png');

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
    BgImages.home,
    BgImages.activity,
    BgImages.events,
    BgImages.community,
    BgImages.profile,
    BgImages.activity_menu,
    BgImages.boxing,
    BgImages.activitysummary,
    BgImages.profilesetting,
    BgImages.askweight,
    BgImages.userprofile,
    BgImages.notification,
    BgImages.rewards,
    BgImages.preferred,
    BgImages.updatepass,
    BgImages.rules,
    BgImages.edit_username,
    BgImages.edit_contact,
    BgImages.event_detail,
  ];

  /// Async method to preload images
  Future<void> preloadImages(BuildContext context) async {
    await Future.wait(images.map((img) {
      return precacheImage(img, context).then((_) => loadedImages.add(img));
    }));
    isLoaded.value = true; // mark all images as loaded
    print(askweight.assetName);
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
  AssetImage get home => BgImages.home;
  AssetImage get activity => BgImages.activity;
  AssetImage get events => BgImages.events;
  AssetImage get community => BgImages.community;
  AssetImage get profile => BgImages.profile;
  AssetImage get activity_menu => BgImages.activity_menu;
  AssetImage get boxing => BgImages.boxing;
  AssetImage get activitysummary => BgImages.activitysummary;
  AssetImage get profilesetting => BgImages.profilesetting;
  AssetImage get askweight => BgImages.askweight;
  AssetImage get userprofile => BgImages.userprofile;
  AssetImage get notification => BgImages.notification;
  AssetImage get rewards => BgImages.rewards;
  AssetImage get preferred => BgImages.preferred;
  AssetImage get updatepass => BgImages.updatepass;
  AssetImage get rules => BgImages.rules;
  AssetImage get edit_username => BgImages.edit_username;
  AssetImage get edit_contact => BgImages.edit_contact;
  AssetImage get event_detail => BgImages.event_detail;
}
