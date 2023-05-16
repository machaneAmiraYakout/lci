import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class FeedbackController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController objectController = TextEditingController();
  Future<void> feedbachInfo() async {
    String fullName = fullNameController.text;
    String mobile = mobileController.text;
    String object = objectController.text;
    try {
      await FirebaseFirestore.instance.collection('feedback').add({
        'fullname': fullName,
        'mobile': mobile,
        'object': object,
      });
      // Data stored successfully
    } catch (e) {
      // Error occurred while storing the data
    }
  }
}
