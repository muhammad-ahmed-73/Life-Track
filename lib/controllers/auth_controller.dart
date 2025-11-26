import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:life_track/controllers/image_controller.dart';

class AuthController extends GetxController{

  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  var newPassword = ''.obs;
  var confirmPassword = ''.obs;

  // Toggles for hiding/showing passwords
  var newPassObscure = true.obs;
  var confirmPassObscure = true.obs;

  // Validation checks
  bool get hasMinLength => newPassword.value.length >= 8;
  bool get hasLetter => newPassword.value.contains(RegExp(r'[A-Za-z]'));
  bool get hasNumber => newPassword.value.contains(RegExp(r'[0-9]'));

  bool get passwordsMatch =>
      newPassword.value == confirmPassword.value && newPassword.isNotEmpty;

  // Password strength label
  String get strength {
    int score = 0;
    if (hasMinLength) score++;
    if (hasLetter) score++;
    if (hasNumber) score++;

    switch (score) {
      case 0:
      case 1:
        return "Too Weak";
      case 2:
        return "Weak";
      case 3:
        return "Strong";
    }
    return "Too Weak";
  }

  // Strength color
  get strengthColor {
    switch (strength) {
      case "Too Weak":
        return const  Color(0xFFFF3B3B);   // red
      case "Weak":
        return const  Color(0xFFFFA500);   // orange
      case "Strong":
        return const Color(0xFF00FF7F);    // green
    }
  }

  RxBool isCheck = false.obs;
  void toggleisCheck (){
    isCheck.value = !isCheck.value;
  }
}