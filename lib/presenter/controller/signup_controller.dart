import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning/presenter/cache_helper.dart';
import 'package:elearning/presenter/controller/home_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/screens/BottomBar_screen.dart';
import '../../view/widgets/my_custom_snackbar.dart';
class SignupController extends GetxController {
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final formKeys = GlobalKey<FormState>();
  late bool obscurePassword = true;
  late final bool isSuccess;
  late PageController _pageController;
  var role = 'user';

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    update(); // Update the state of the widget
  }
  double currentPageValue = 0.0;
  @override
  void onInit() {
    super.onInit();
    _pageController = PageController();
    _pageController.addListener(() {
      currentPageValue = _pageController.page!;
      update();
    });
  }

  Future<void> signup() async {
    String name = nameController.text;
    String email = mailController.text;
    String password = passwordController.text;
    try {
      // Create a new user account in Firebase
      final UserCredential userCredential =
      await auth.createUserWithEmailAndPassword(email: email, password: password,);
      // Store the user's name in Cloud Firestore
      await FirebaseFirestore.instance.collection('userInformation').doc(userCredential.user!.uid).set({
        'name': name,
        'role': role,
      });
      // Update the name field
      final HomeController homeController = Get.put(HomeController());
      await homeController.loadUserName();
      await CacheHelper.saveData(key: 'token', value: userCredential.user!.uid);
      CustomSnackbar('Success', 'Registration successful', isSuccess: true);
      Get.to(() => BottomBar());
    } catch (e) {
      CustomSnackbar('Error', e.toString());
    }
  }
}