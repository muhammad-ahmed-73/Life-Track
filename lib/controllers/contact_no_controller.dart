import 'package:get/get.dart';

class ContactController extends GetxController {
  // Phone number and email
  var phoneNumber = ''.obs;
  var email = ''.obs;

  // Reactive check flags
  RxBool get isPhoneValid => (phoneNumber.value.replaceAll(RegExp(r'[^0-9]'), '').length == 10).obs;
  RxBool get isEmailValid => (email.value.trim().isNotEmpty).obs;

  void updatePhone(String value) {
    phoneNumber.value = value;
  }

  void updateEmail(String value) {
    email.value = value;
  }
}
