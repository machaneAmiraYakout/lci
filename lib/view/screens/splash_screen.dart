import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controller/splash_controller.dart';
class SplashScreen extends StatelessWidget {
  final SplashController splashController;
  const SplashScreen({Key? key, required this.splashController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png',width: 200,height: 200,),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}