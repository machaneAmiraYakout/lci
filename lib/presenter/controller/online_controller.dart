import 'package:elearning/view/screens/hiring_screen.dart';
import 'package:elearning/view/screens/inscription_screen.dart';
import 'package:elearning/view/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../view/widgets/colors.dart';
class OnlineController extends GetxController {
  RxBool isAuthenticated = false.obs;
  @override
  void onInit() {
    super.onInit();
    checkAuthStatus();
  }
  void checkAuthStatus() {
    if (FirebaseAuth.instance.currentUser != null) {
      isAuthenticated.value = true;
    } else {
      isAuthenticated.value = false;
    }
  }
  void showSignUpAlert(BuildContext context, String screen) {
    if (!isAuthenticated.value) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              children: const [
                Icon(
                  Icons.warning,
                  color: buttonColor,
                ),
                SizedBox(width: 10),
                Text(
                  'Sign Up Required',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color:primaryColor ,
                  ),
                ),
              ],
            ),
            content: const Text(
              'To access the inscription and hiring features, you need to sign up.',
              style: TextStyle(
                  fontSize: 16,
              color: primaryColor),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Get.to(() => SignupScreen());
                },
                child: Text('Sign Up'),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Close'),
              ),
            ],
          );
        },
      );
    } else {
      if (screen == 'Inscription') {
        Get.to(() => Inscription());
      } else if (screen == 'Hiring') {
        Get.to(() => Hiring());
      }
    }
  }
}
