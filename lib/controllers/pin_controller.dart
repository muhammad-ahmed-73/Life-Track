
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

// GetX Controller for PIN management
class PinController extends GetxController {
  final pin = ''.obs;

  void addDigit(String digit) {
    if (pin.value.length < 4) {
      pin.value += digit;
    }
  }

  void removeDigit() {
    if (pin.value.isNotEmpty) {
      pin.value = pin.value.substring(0, pin.value.length - 1);
    }
  }

  void clear() {
    pin.value = '';
  }

  bool get isComplete => pin.value.length == 4;
}