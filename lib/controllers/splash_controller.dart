import 'package:get/get.dart';

import 'image_controller.dart';

class SplashController extends GetxController {
  final String nextRoute;

  SplashController(this.nextRoute);
  final ImageController imageController = Get.find<ImageController>();

  @override
  void onInit() {
    super.onInit();
    // Navigate after delay
    _init();
  }
  Future<void> _init() async {
    final context = Get.context!;
    // Preload images
    await imageController.preloadImages(context);
    // Optional delay for splash animation
    await Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(nextRoute);
    });
  }
}
