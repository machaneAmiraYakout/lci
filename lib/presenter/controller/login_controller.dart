import 'package:elearning/presenter/cache_helper.dart';
import 'package:elearning/presenter/controller/home_controller.dart';
import 'package:elearning/view/screens/started_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/screens/BottomBar_screen.dart';
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

        // Check if the email is verified
        if (userCredential.user!.emailVerified) {
          // Save login info
          await CacheHelper.saveData(key: 'token', value: userCredential.user!.uid);

          // Update the HomeController instance to load the user name
          final HomeController homeController = Get.put(HomeController());
          await homeController.loadUserName();
          homeController.startTimer();

          // Clear the input fields and show a success message
          mailController.clear();
          passwordController.clear();
          CustomSnackbar('Success', 'Login successful', isSuccess: true);
          Get.to(() => BottomBar());
        } else {
          CustomSnackbar('Error', 'Please verify your email to log in.');
        }
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
    Get.offAll(() => const StartScreen());
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
