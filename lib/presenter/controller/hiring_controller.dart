import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import '../../view/widgets/my_custom_snackbar.dart';

class HiringController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  late FocusNode birthdayFocusNode;

  @override
  void onInit() {
    super.onInit();
    birthdayFocusNode = FocusNode();
  }

  var selectedDate = DateTime.now().obs;

  Future<void> pickDate(BuildContext context) async {
    try {
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
    } catch (error) {
      print('Error while picking date: $error');
    }
  }

  @override
  void onClose() {
    birthdayFocusNode.dispose();
    super.onClose();
  }

  var selectedFile = Rx<File?>(null);

  Future<String> copyPdfFile(File file) async {
    try {
      final appDocDir = await getApplicationDocumentsDirectory();
      final fileName = path.basename(file.path);
      final newFilePath = path.join(appDocDir.path, fileName);

      await file.copy(newFilePath);
      return newFilePath;
    } catch (e) {
      print('Error copying PDF file: $e');
      return '';
    }
  }


  void selectFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      final selectedFile = File(result.files.single.path!);
      final copiedFilePath = await copyPdfFile(selectedFile);
      if (copiedFilePath.isNotEmpty) {
        this.selectedFile.value = File(copiedFilePath);
      }
    }
  }

  Future<String> uploadPdfFile(File file) async {
    final storageRef = FirebaseStorage.instance.ref().child('pdf');
    final filePath = file.path;
    final fileName = path.basename(filePath);
    final pdfRef = storageRef.child(fileName);
    try {
      await pdfRef.putFile(File(filePath));
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

  Future<void> storeHiringInfo(
      String fullName,
      String email,
      DateTime date,
      String address,
      String mobile,
      String pdfUrl,
      ) async {
    final hiringCollection = FirebaseFirestore.instance.collection('hiring');
    final querySnapshot = await hiringCollection.where('email', isEqualTo: email).get();
    if (querySnapshot.docs.isEmpty) {
      await hiringCollection.add({
        'fullName': fullName,
        'email': email,
        'date': date,
        'address': address,
        'mobile': mobile,
        'pdfUrl': pdfUrl,
      });
      CustomSnackbar('Success', 'Your Apply has been successfully accepted', isSuccess: true);
    } else {
      print('User with email $email already subscribed');
      CustomSnackbar('Refused', 'User with email $email already subscribed', isSuccess: false);
      // You can show an error message or take any other action to notify the user that they have already subscribed
    }
  }

  Future<void> submitForm() async {
    final fullName = fullNameController.text.trim();
    final email = emailController.text.trim();
    final date = selectedDate.value;
    final address = addressController.text.trim();
    final mobile = mobileController.text.trim();
    final file = selectedFile.value;

    if (fullName.isEmpty || email.isEmpty || date == null || file == null) {
      // Show an error message if any required field is missing
      return;
    }

    try {
      final copiedFilePath = await copyPdfFile(file);

      if (copiedFilePath.isNotEmpty) {
        final pdfUrl = await uploadPdfFile(File(copiedFilePath));

        if (pdfUrl.isNotEmpty) {
          await storeHiringInfo(fullName, email, date, address, mobile, pdfUrl);
          // Clear the form fields after successful submission
          fullNameController.clear();
          emailController.clear();
          birthdayController.clear();
          addressController.clear();
          mobileController.clear();
          selectedDate.value = DateTime.now();
          selectedFile.value = null;
        } else {
          // Handle the case where the PDF upload fails
          print('Error uploading PDF file');
          // Display an error message to the user or take appropriate action
        }
      } else {
        // Handle the case where the PDF copy fails
        print('Error copying PDF file');
        // Display an error message to the user or take appropriate action
      }
    } catch (error) {
      print('Error submitting form: $error');
      // Handle any errors that occurred during the upload process
    }
  }
}