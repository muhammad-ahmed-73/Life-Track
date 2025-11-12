import 'package:get/get.dart';
import 'package:life_track/views/auth_screens/forget_screen.dart';
import 'package:life_track/views/auth_screens/signup_screen.dart';
import 'package:life_track/views/dashboard_screens/preferredsprots_screen.dart';
import 'package:life_track/views/onboarding_screens/onboarding_screen.dart';
import 'package:life_track/views/splash_screen/splash_screen.dart';

import '../views/auth_screens/login_screen.dart';
import '../views/auth_screens/create_new_pin_screen.dart';
import '../views/auth_screens/verification_screen.dart';
import '../views/dashboard_screens/getnotified_screen.dart';

class AppRoutes {
  static List<GetPage<dynamic>> routes = [
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(name: '/onboarding', page: () => OnboardingScreen()),
    GetPage(name: '/signup', page: () => SignupScreen()),
    GetPage(name: '/login', page: () => LoginScreen()),
    GetPage(name: '/forget', page: () => ForgetScreen()),
    GetPage(name: '/verification', page: () => VerificationScreen()),
    GetPage(name: '/newPin', page: () => CreateNewPinScreen()),
    GetPage(name: '/preferredsports', page: () => PreferredsprotsScreen()),
    GetPage(name: '/getnotified', page: () => GetnotifiedScreen()),
    // GetPage(name: '/forgot', page: () => ForgotPassScreen()),
    // GetPage(name: '/reset', page: () => ResetPassScreen()),

  ];
}
