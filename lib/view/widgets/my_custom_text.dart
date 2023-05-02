import 'package:elearning/view/widgets/colors.dart';
import 'package:flutter/material.dart';
class MyCustomTextWidget extends StatelessWidget {
  final int index;
  final String text;
  final Color? color;
  MyCustomTextWidget({required this.index, required this.text,this.color=primaryColor});
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle;
    switch (index) {
      case 1://head
        textStyle =const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 25,
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
            color: buttonColor,
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
