import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
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
  }

}