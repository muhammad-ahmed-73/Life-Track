import 'package:get/get.dart';

class RewardsController extends GetxController{
  RxInt selectedIndex = 0.obs;

  void updateSelectedIndex (int index){
    selectedIndex.value = index;
  }
}