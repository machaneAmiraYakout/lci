import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning/presenter/controller/home_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProfileController extends GetxController{
  var isEditing = false.obs;
  final HomeController homeController = Get.put(HomeController());
  final TextEditingController newPasswordController = TextEditingController();
  void toggleEditing() {
    isEditing.toggle();
  }
  Future<void> updateUserName(String newName) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final docReference = FirebaseFirestore.instance
          .collection('userInformation')
          .doc(user.uid);
      await docReference.update({'name': newName});
      homeController.name.value = newName;
    }
    update();
  }
  void updatePassword(String newValue) async {
    String newPassword = newValue.trim();

    if (newPassword.isEmpty) {
      Get.snackbar('Error', 'Please enter a new password');
      return;
    }

    try {
      User? user = FirebaseAuth.instance.currentUser;
      await user!.updatePassword(newPassword);
      Get.snackbar('Success', 'Password updated successfully');
    } catch (error) {
      Get.snackbar('Error', 'Failed to update password: $error');
    }
  }
}
