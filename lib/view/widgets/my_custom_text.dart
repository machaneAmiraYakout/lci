import 'package:elearning/view/widgets/colors.dart';
import 'package:flutter/material.dart';
class MyCustomTextWidget extends StatelessWidget {
  final int index;
  final String text;
  final Color? color;
  final TextAlign alignment;
  MyCustomTextWidget({required this.index, required this.text,this.color=primaryColor, this.alignment=TextAlign.center,});
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle;
    switch (index) {
      case 1://head
        textStyle =const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 21,
            fontWeight: FontWeight.w700,
            color: primaryColor,
          letterSpacing: 2,
        );
        break;
      case 2://Subtitle
        textStyle =const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: subTitleTextColor,
        );
        break;
      case 3://Subtitle
        textStyle =const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: thirdColor,
        );
        break;
      case 4://Subtitle
        textStyle =const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 19,
          fontWeight: FontWeight.w400,
          color: thirdColor,
        );
        break;
      case 5://Subtitle
        textStyle =const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 19,
          fontWeight: FontWeight.w400,
          color: secondColor,
        );
        break;
      case 6://Subtitle
        textStyle =const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: thirdColor,
        );
        break;
      case 7://head
        textStyle =const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 25,
          fontWeight: FontWeight.w700,
          color: buttonColor,
          letterSpacing: 2,
        );
        break;
      case 8://head
        textStyle =const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          letterSpacing: 2,

        );
        break;
      case 9://Subtitle
        textStyle =const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: textFieldCBackgroundColor,
        );
        break;
      case 10://Subtitle
        textStyle =const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: buttonColor,
        );
        break;
      case 11://head
        textStyle =const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 21,
          fontWeight: FontWeight.w700,
          color: buttonColor,
          letterSpacing: 2,
        );
        break;
      case 12://head
        textStyle =const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 19,
          fontWeight: FontWeight.w700,
          color: buttonColor,
          letterSpacing: 2,
        );
        break;
      case 13://Subtitle
        textStyle =const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: buttonColor,
        );
        break;
      case 14://head
        textStyle =const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: primaryColor,
          letterSpacing: 2,

        );
        break;
      default:
        textStyle =const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12,
          fontWeight: FontWeight.w400,
        );
    }
    return Text(
      text,
      style:textStyle,
    );
  }
}
