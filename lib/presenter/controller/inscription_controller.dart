import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/widgets/my_custom_snackbar.dart';
class InscriptionController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController fonctionController = TextEditingController();
  TextEditingController formationController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController commentaireController = TextEditingController();
  String courseDropdownValue = '';
  String subCourseDropdownValue ='';
  Future<void> addInscriptionGuest() async {
    try {
      final guestRef = FirebaseFirestore.instance.collection('inscriptions');
      // Check if there is an existing subscription with the same email and formation
      final querySnapshot = await guestRef
          .where('email', isEqualTo: emailController.text)
          .where('subCourse', isEqualTo: subCourseDropdownValue)
          .get();
      // If a document with the same email and formation already exists, do not add a new subscription
      if (querySnapshot.docs.isNotEmpty) {
        print('User has already subscribed to this formation');
        CustomSnackbar('Refused', 'You have already subscribed to this formation', isSuccess: false);
        return;
      }
      // Proceed with adding the subscription since the user hasn't subscribed to this formation before
      final newInsDocRef = guestRef.doc();
      print('hiiiiiiiiiiiiiiiiiiiiiiiii ${fullNameController.text}');
      await newInsDocRef.set({
        'fullName': fullNameController.text,
        'email': emailController.text,
        'age': ageController.text,
        'fonction': fonctionController.text,
        'course': courseDropdownValue, // Store the selected course value
        'subCourse': subCourseDropdownValue, // Store the selected sub-course value
        'mobile': mobileController.text,
        'commentaire': commentaireController.text,
      });
      print('Guest added successfully');
      CustomSnackbar('Success', 'Your registration has been successfully accepted', isSuccess: true);
      clearTextFields(); // Clear the text fields
    } catch (error) {
      print(error.toString());
    }
  }
  void clearTextFields() {
    fullNameController.clear();
    emailController.clear();
    ageController.clear();
    fonctionController.clear();
    formationController.clear();
    mobileController.clear();
    commentaireController.clear();
  }
}