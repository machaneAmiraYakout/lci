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
  Future<void> addInscriptionGuest() async {
    try {
      final guestRef = FirebaseFirestore.instance.collection('inscriptions');

      // Check if there is an existing subscription with the same email and formation
      final querySnapshot = await guestRef
          .where('email', isEqualTo: emailController.text)
          .where('formation', isEqualTo: formationController.text)
          .get();

      // If a document with the same email and formation already exists, do not add a new subscription
      if (querySnapshot.docs.isNotEmpty) {
        print('User has already subscribed to this formation');
        CustomSnackbar('Refused', 'you have already subscribed to this formation', isSuccess: false);

        return;
      }

      // Proceed with adding the subscription since the user hasn't subscribed to this formation before
      final newInsDocRef = guestRef.doc();
      await newInsDocRef.set({
        'fullName': fullNameController.text,
        'email': emailController.text,
        'age': ageController.text,
        'fonction': fonctionController.text,
        'formation': formationController.text,
        'mobile': mobileController.text,
        'commentaire': commentaireController.text,
      });

      print('Guest added successfully');
      CustomSnackbar('Success', 'Your registration has been successfully accepted', isSuccess: true);
    } catch (error) {
      print(error.toString());
    }
  }
}