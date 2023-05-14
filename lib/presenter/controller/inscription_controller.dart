import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    } catch (error) {
      print(error.toString());
    }
  }
}
