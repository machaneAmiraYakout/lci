
import 'package:elearning/presenter/cache_helper.dart';
import 'package:elearning/view/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/screens/home_page.dart';
import '../../view/widgets/my_custom_snackbar.dart';
class LoginController extends GetxController {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  final RxBool rememberMe = false.obs;
  final RxString email = ''.obs;
  final RxString password = ''.obs;
  late bool obscurePassword = true;
  late PageController _pageController;
  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    update(); // Update the state of the widget
  }
  Future<void> login() async {
    final email = mailController.text;
    final password = passwordController.text;
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        // Sign in the user
        final UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
        //save login info
        await CacheHelper.saveData(key: 'token', value: userCredential.user!.uid);

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
  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => LoginScreen());
    CacheHelper.removeData(key: 'token');
  }
  void resetPassword() async {
    String email = mailController.text.trim();
    if (email.isNotEmpty) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        CustomSnackbar('Reset Password', 'Reset link has been sent to $email', isSuccess: true);
      } catch (e) {
        CustomSnackbar('Error', e.toString());
      }
    } else {
      Get.snackbar('Error', 'Please enter your email!');
    }
  }

}
