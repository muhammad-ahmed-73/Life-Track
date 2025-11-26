import 'package:get/get.dart';

class ProfileController extends GetxController {
  // Switch ki state
  RxBool notificationsOn = false.obs;
  final RxString weight = "175".obs;


  void toggleNotifications() {
    notificationsOn.value = !notificationsOn.value;
  }
}
