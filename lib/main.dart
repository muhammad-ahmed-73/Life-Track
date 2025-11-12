import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_track/utils/App_Routing.dart';
import 'package:life_track/utils/init_binding.dart';
import 'package:sizer/sizer.dart';

import 'controllers/image_controller.dart';
import 'controllers/onboarding_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ImageController());
  Get.put(OnboardingController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {

        return GetMaterialApp(
          initialBinding: Binding(),
          initialRoute: '/',
          getPages: AppRoutes.routes,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              //scaffoldBackgroundColor: backgroundColor
          ),
          // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },

    );
  }
}
