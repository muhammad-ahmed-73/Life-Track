import 'package:get/get.dart';
import 'package:life_track/views/dashboard_screens/community_screen.dart';
import 'package:life_track/views/dashboard_screens/events_screen.dart';
import 'package:life_track/views/dashboard_screens/profile_screen.dart';

import '../views/dashboard_screens/activity_screen.dart';
import '../views/dashboard_screens/home_screen.dart';
import '../views/menu_screens/activity_menu.dart';

class DashboardController extends GetxController {
  final RxInt selectedIndex = 0.obs;


  final pages = [
        () => HomeScreen(),
        () => ActivityScreen(),
        () => EventsScreen(),
        () => CommunityScreen(),
        () => ProfileScreen(),
  ];


  void onTabTapped(int index) {
    selectedIndex.value = index;
  }
  void jumpToActivity(){
    selectedIndex.value = 1;
  }
  void jumpToEvent(){
    selectedIndex.value = 2;
  }

  // Activity screen tab controller
  RxBool isPreferredSelected = true.obs;

  void selectPreferred() => isPreferredSelected.value = true;
  void selectAreaSports() => isPreferredSelected.value = false;
}
