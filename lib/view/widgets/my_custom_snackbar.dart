import 'package:elearning/view/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 CustomSnackbar(String title,String message, {bool isSuccess = false}) {
  Color backgroundColor = isSuccess ?  buttonColor: primaryColor;
  String title = isSuccess ? 'Success' : 'Error';
  Get.snackbar(
    title,
    message,
    backgroundColor: backgroundColor,
    colorText: Colors.white,
    duration:const Duration(seconds: 5),
  );
}