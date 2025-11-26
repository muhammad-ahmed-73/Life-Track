import 'package:get/get.dart';
import 'package:life_track/views/auth_screens/forget_screen.dart';
import 'package:life_track/views/auth_screens/signup_screen.dart';
import 'package:life_track/views/dashboard_screens/activity_screen.dart';
import 'package:life_track/views/dashboard_screens/dashboard_screen.dart';
import 'package:life_track/views/dashboard_screens/events_screen.dart';
import 'package:life_track/views/dashboard_screens/preferredsprots_screen.dart';
import 'package:life_track/views/dashboard_screens/profile_screen.dart';
import 'package:life_track/views/menu_screens/activity_menu.dart';
import 'package:life_track/views/menu_screens/activity_summary.dart';
import 'package:life_track/views/menu_screens/ask_weight_screen.dart';
import 'package:life_track/views/menu_screens/edit_age.dart';
import 'package:life_track/views/menu_screens/edit_contact.dart';
import 'package:life_track/views/menu_screens/edit_username.dart';
import 'package:life_track/views/menu_screens/notification_screen.dart';
import 'package:life_track/views/menu_screens/preferred_screen.dart';
import 'package:life_track/views/menu_screens/profile_setting.dart';
import 'package:life_track/views/menu_screens/rewards_screen.dart';
import 'package:life_track/views/menu_screens/rules_screen.dart';
import 'package:life_track/views/menu_screens/update_password.dart';
import 'package:life_track/views/onboarding_screens/onboarding_screen.dart';
import 'package:life_track/views/splash_screen/splash_screen.dart';

import '../views/auth_screens/login_screen.dart';
import '../views/auth_screens/create_new_pin_screen.dart';
import '../views/auth_screens/verification_screen.dart';
import '../views/dashboard_screens/getnotified_screen.dart';
import '../views/menu_screens/user_profile_screen.dart';

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
    GetPage(name: '/dashboard', page: () => DashboardScreen()),
    GetPage(name: '/activity', page: () => ActivityScreen()),
    GetPage(name: '/events', page: () => EventsScreen()),
    GetPage(name: '/profile', page: () => ProfileScreen()),
    GetPage(name: '/activitysummary', page: () => ActivitySummary()),
    GetPage(name: '/profilesetting', page: () => ProfileSetting()),
    GetPage(name: '/askweight', page: () => AskWeightScreen()),
    GetPage(name: '/notification', page: () => NotificationScreen()),
    GetPage(name: '/rewards', page: () => RewardsScreen()),
    GetPage(name: '/preferred', page: () => PreferredScreen()),
    GetPage(name: '/updatepass', page: () => UpdatePassword()),
    GetPage(name: '/rules', page: () => RulesScreen()),
    GetPage(name: '/username', page: () => EditUsername()),
    GetPage(name: '/age', page: () => EditAge()),
    GetPage(name: '/contact', page: () => EditContact()),
    //GetPage(name: '/activitymenu', page: () => ActivityMenu()),
    // GetPage(name: '/forgot', page: () => ForgotPassScreen()),
    // GetPage(name: '/reset', page: () => ResetPassScreen()),

  ];
}
