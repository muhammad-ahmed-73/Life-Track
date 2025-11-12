import 'package:get/get.dart';
import 'package:life_track/controllers/image_controller.dart';

class AuthController extends GetxController{
  RxBool isCheck = false.obs;

  void toggleisCheck (){
    isCheck.value = !isCheck.value;
  }
}