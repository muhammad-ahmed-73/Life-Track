import 'package:get/get.dart';

class ActivityMenuController extends GetxController{
  RxBool isContinue = false.obs;
  RxInt isOptionSelected = 0.obs;
  RxInt isOptionLeaderboard = 0.obs;

  void toggleIsContinue(){
    isContinue.value = !isContinue.value;
  }
  void updateIsOptionSelected(int index){
    isOptionSelected.value = index;
  }
  void updateIsOptionLeaderboard(int index){
    isOptionSelected.value = index;
  }
}