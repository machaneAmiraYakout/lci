
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/screens/home_page.dart';
import '../../view/widgets/my_custom_snackbar.dart';
class LoginController extends GetxController {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> login() async {
    final email = mailController.text;
    final password = passwordController.text;
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        // Sign in the user
        final UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
        // Clear the input fields and show a success message
        mailController.clear();
        passwordController.clear();
        CustomSnackbar('Success', 'Login successful', isSuccess: true);
        Get.to(() => HomeScreen());

      } catch (e) {
        CustomSnackbar('Error', e.toString());
      }
    } else {
      Get.snackbar('Error', 'Please enter email and password!');
    }
  }

  @override
  void dispose() {
    mailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
