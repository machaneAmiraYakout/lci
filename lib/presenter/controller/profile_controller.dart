import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning/presenter/controller/home_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/widgets/my_custom_snackbar.dart';
class ProfileController extends GetxController{
  var isEditing = false.obs;
  String currentPassword='';
  String newPassword='';
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
  void updatePasswordf() async {
    if (currentPassword.isEmpty || newPassword.isEmpty) {
      CustomSnackbar('Error', 'Please enter both current and new passwords', isSuccess: false);
      return;
    }
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Reauthenticate the user with the current password stored in Firebase
        AuthCredential credential = EmailAuthProvider.credential(email: user.email!, password: currentPassword);
        await user.reauthenticateWithCredential(credential);
        // Update the password with the new one
        await user.updatePassword(newPassword);
        CustomSnackbar('Success', 'Password updated successfully', isSuccess: true);
      } else {
        CustomSnackbar('Error', 'User not signed in', isSuccess: false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        CustomSnackbar('Error', 'Invalid current password', isSuccess: false);
      } else {
        CustomSnackbar('Error', 'Failed to update password: ${e.message}', isSuccess: false);
      }
    } catch (error) {
      print('Error updating password: $error');
      CustomSnackbar('Error', 'Failed to update password', isSuccess: false);
    }
  }
}
