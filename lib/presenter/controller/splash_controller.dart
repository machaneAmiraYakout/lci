import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/screens/started_screen.dart';
class SplashController extends GetxController {
  final  Widget nextScreen;

  SplashController(this.nextScreen);
  @override
  void onReady() {
    super.onReady();
    // Wait for some time and then navigate to the next screen
    Future.delayed(Duration(seconds: 3), () {
      Get.off(nextScreen);
    });
  }
}
