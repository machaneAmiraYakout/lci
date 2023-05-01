import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning/presenter/cache_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/screens/home_page.dart';
import '../../view/widgets/my_custom_snackbar.dart';
class SignupController extends GetxController {
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final formKeys = GlobalKey<FormState>();
  final RxBool obscurePassword = true.obs;
  late final bool isSuccess;
  late PageController _pageController;
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
    String email = mailController.text;
    String password = passwordController.text;
    try {
      // Create a new user account in Firebase
      final UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password,);
      await CacheHelper.saveData(key: 'token', value: userCredential.user!.uid);
      CustomSnackbar('Success', 'Registration successful', isSuccess: true);
      Get.to(() => HomeScreen());
    } catch (e) {
      CustomSnackbar('Error', e.toString());
    }
  }
}


