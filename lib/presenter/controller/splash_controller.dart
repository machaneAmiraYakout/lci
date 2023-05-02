import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/screens/started_screen.dart';
class SplashController extends GetxController {

  @override
  void onReady() {
    super.onReady();
    // Wait for some time and then navigate to the home screen
    Future.delayed(const Duration(seconds: 3), () {
      //Get.off(() => const StartScreen());


    });
  }
}
