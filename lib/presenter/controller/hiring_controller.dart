import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
class HiringController extends GetxController{
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  late FocusNode birthdayFocusNode;
  @override
  void onInit() {
    super.onInit();
    birthdayFocusNode = FocusNode();
  }
  var selectedDate = DateTime.now().obs;
  Future<void> pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
      final formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      birthdayController.text = formattedDate;
    }
  }
  @override
  void onClose() {
    birthdayFocusNode.dispose();
    super.onClose();
  }
  var selectedFile = Rx<File?>(null);
  void selectFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      selectedFile.value = File(result.files.single.path!);
    }
    print('file tapped');
    print('${selectedFile.value}ggggggggg');
  }
  // Function to upload a PDF file to Firebase Storage
  Future<String> uploadPdfFile(File file) async {
    final storageRef = FirebaseStorage.instance.ref().child('/.pdf');
    final fileName = path.basename(file.path);
    final pdfRef = storageRef.child(fileName);
    try {
      await pdfRef.putFile(file);
      final pdfUrl = await pdfRef.getDownloadURL();
      print('File path: $fileName');
      print('File URL: $pdfUrl');
      return pdfUrl;
    } catch (e) {
      if (e == 'object-not-found') {
        print('Object not found');
      } else {
        print('Error: $e');
      }
      return '';
    }
  }
  // Function to store the date and PDF URL in the "hiring" collection
  Future<void> submitForm() async {
    final fullName = fullNameController.text.trim();
    final email = emailController.text.trim();
    final date = selectedDate.value;
    final address = adressController.text.trim();
    final mobile = mobileController.text.trim();
    final file = selectedFile.value;
    if (fullName.isEmpty || email.isEmpty || date == null || file == null) {
      // Show an error message if any required field is missing
      return;
    }
    Future<void> storeHiringInfo(
        String fullName,
        String email,
        DateTime date,
        String address,
        String mobile,
        String pdfUrl,
        ) async {
      final hiringCollection = FirebaseFirestore.instance.collection('hiring');
      await hiringCollection.add({
        'fullName': fullName,
        'email': email,
        'date': date,
        'address': address,
        'mobile': mobile,
        'pdfUrl': pdfUrl,
      });
    }
    final pdfUrl = await uploadPdfFile(file);
    await storeHiringInfo(fullName, email, date, address, mobile, pdfUrl);
    // Clear the form fields after submission
    fullNameController.clear();
    emailController.clear();
    birthdayController.clear();
    adressController.clear();
    mobileController.clear();
    selectedDate.value = DateTime.now();
    selectedFile.value = null;
  }


}