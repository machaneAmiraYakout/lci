import 'package:elearning/view/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controller/settings_controller.dart';
class MyCustomTextWidget extends StatelessWidget {
  final SettingsController settingscontroller = Get.put(SettingsController());
  final int index;
  final String text;
  final Color? color;
  final TextAlign alignment;
  MyCustomTextWidget({
    required this.index,
    required this.text,
    this.color = primaryColor,
    this.alignment = TextAlign.center,
  });
  double getResponsiveFontSize(BuildContext context, double referenceSize) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final referenceWidth = 375; // Reference width for font size calculations (you can adjust it based on your design)
    // Calculate the ratio of the screen's width to the reference width
    final widthRatio = screenWidth / referenceWidth;
    // Calculate the responsive font size
    final fontSize = referenceSize * widthRatio;

    return fontSize;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle;
    switch (index) {
      case 1: // Head
        textStyle = TextStyle(
          fontFamily: 'Poppins',
          fontSize: getResponsiveFontSize(context, 21),
          fontWeight: FontWeight.w700,
          color: settingscontroller.isDarkMode.value
              ? Colors.white// Use dark mode color
              : primaryColor, // Use light mode color
          letterSpacing: 2,
        );
        break;
      case 2://Subtitle
        textStyle = TextStyle(
          fontFamily: 'Poppins',
          fontSize:getResponsiveFontSize(context, 15),
          fontWeight: FontWeight.w400,
          color: settingscontroller.isDarkMode.value
              ? Colors.white// Use dark mode color
              : subTitleTextColor, // Use light mode color
        );
        break;
      case 3://Subtitle
        textStyle = TextStyle(
          fontFamily: 'Poppins',
          fontSize: getResponsiveFontSize(context, 12),
          fontWeight: FontWeight.w400,
          color: settingscontroller.isDarkMode.value
              ? Colors.white// Use dark mode color
              : thirdColor, // Use light mode color
        );
        break;
      case 4://Subtitle
        textStyle = TextStyle(
          fontFamily: 'Poppins',
          fontSize:getResponsiveFontSize(context, 19),
          fontWeight: FontWeight.w400,
          color: settingscontroller.isDarkMode.value
              ? Colors.white// Use dark mode color
              : thirdColor, // Use light mode color
        );
        break;
      case 5://Subtitle
        textStyle = TextStyle(
          fontFamily: 'Poppins',
          fontSize:getResponsiveFontSize(context, 19),
          fontWeight: FontWeight.w400,
          color: settingscontroller.isDarkMode.value
              ? Colors.white// Use dark mode color
              : secondColor, // Use light mode color
        );
        break;
      case 6://Subtitle
        textStyle = TextStyle(
          fontFamily: 'Poppins',
          fontSize:getResponsiveFontSize(context, 20),
          fontWeight: FontWeight.w400,
          color: settingscontroller.isDarkMode.value
              ? Colors.white// Use dark mode color
              : thirdColor, // Use light mode color
        );
        break;
      case 7://head
        textStyle = TextStyle(
          fontFamily: 'Poppins',
          fontSize: getResponsiveFontSize(context, 25),
          fontWeight: FontWeight.w700,
          color: settingscontroller.isDarkMode.value
              ? Colors.white// Use dark mode color
              : buttonColor, // Use light mode color
          letterSpacing: 2,
        );
        break;
      case 8://head
        textStyle = TextStyle(
          fontFamily: 'Poppins',
          fontSize:getResponsiveFontSize(context, 20),
          fontWeight: FontWeight.w700,
          color: Colors.white,
          letterSpacing: 2,

        );
        break;
      case 9://Subtitle
        textStyle = TextStyle(
          fontFamily: 'Poppins',
          fontSize:getResponsiveFontSize(context, 15),
          fontWeight: FontWeight.w400,
          color: settingscontroller.isDarkMode.value
              ? subTitleTextColor// Use dark mode color
              : buttonColor , // Use light mode color
        );
        break;
      case 10://Subtitle
        textStyle = TextStyle(
          fontFamily: 'Poppins',
          fontSize:getResponsiveFontSize(context, 12),
          fontWeight: FontWeight.w400,
          color: settingscontroller.isDarkMode.value
              ? Colors.white// Use dark mode color
              : buttonColor, // Use light mode color
        );
        break;
      case 11://head
        textStyle = TextStyle(
          fontFamily: 'Poppins',
          fontSize:getResponsiveFontSize(context, 21),
          fontWeight: FontWeight.w700,
          color: settingscontroller.isDarkMode.value
              ? Colors.white// Use dark mode color
              : buttonColor, // Use light mode color
          letterSpacing: 2,
        );
        break;
      case 12://head
        textStyle = TextStyle(
          fontFamily: 'Poppins',
          fontSize: getResponsiveFontSize(context, 19),
          fontWeight: FontWeight.w700,
          color: settingscontroller.isDarkMode.value
              ? Colors.white// Use dark mode color
              : buttonColor, // Use light mode color
          letterSpacing: 2,
        );
        break;
      case 13://Subtitle
        textStyle = TextStyle(
          fontFamily: 'Poppins',
          fontSize: getResponsiveFontSize(context, 15),
          fontWeight: FontWeight.w400,
          color: settingscontroller.isDarkMode.value
              ? Colors.white// Use dark mode color
              : buttonColor, // Use light mode color
        );
        break;
      case 14://head
        textStyle = TextStyle(
          fontFamily: 'Poppins',
          fontSize:getResponsiveFontSize(context, 11),
          fontWeight: FontWeight.w500,
          color: settingscontroller.isDarkMode.value
              ? Colors.white// Use dark mode color
              : primaryColor, // Use light mode color
          letterSpacing: 2,

        );
        break;
      case 15://Subtitle
        textStyle = TextStyle(
          fontFamily: 'Poppins',
          fontSize: getResponsiveFontSize(context, 12),
          fontWeight: FontWeight.w400,
          color: Colors.white,
        );
        break;
      case 16://Subtitle
        textStyle = TextStyle(
          fontFamily: 'Poppins',
          fontSize:getResponsiveFontSize(context, 15),
          fontWeight: FontWeight.w400,
          color: settingscontroller.isDarkMode.value
              ? subTitleTextColor// Use dark mode color
              : primaryColorwithopacity , // Use light mode color
        );
        break;

      default:
        textStyle = TextStyle(
          fontFamily: 'Poppins',
          fontSize: getResponsiveFontSize(context, 12),
          fontWeight: FontWeight.w400,
        );
    }

    return  Text(
      text,
      style: textStyle,
    );
  }
}
