import 'package:elearning/view/widgets/my_custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
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
      CustomSnackbar('Success', 'Your registration has been successfully accepted', isSuccess: true);
    } catch (e) {
      // Error occurred while storing the data
      CustomSnackbar('Refused', 'Your registration has been refused', isSuccess: false);

    }
  }
  void clearTextFields() {
    fullNameController.clear();
    mobileController.clear();
    objectController.clear();
  }
}
