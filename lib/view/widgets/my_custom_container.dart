import 'package:elearning/view/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controller/settings_controller.dart';
import 'my_custom_text.dart';
class MyContainer extends StatelessWidget {
  final SettingsController settingscontroller = Get.put(SettingsController());
  final String text;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final IconData? icon;
  final Color containerColor;
  final int index;
  final double sizeicon;
  GestureTapCallback? gestuorTap;
  final double? widthContainer;
  final double?heightContainer;
  MyContainer({
    required this.text,
    this.borderRadius = 20.0,
    this.borderColor = Colors.grey,
    this.borderWidth = 1.0,
    required this.index,
    this.containerColor = Colors.white,
    this.gestuorTap,
    this.sizeicon = 50,
    this.widthContainer,
    this.heightContainer=80,
    this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: GestureDetector(
        onTap: gestuorTap,
        child: Container(
          height:heightContainer ,
          width: widthContainer, // Set the width of the container if provided
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: settingscontroller.isDarkMode.value
                  ?  Colors.black// Use dark mode color
                  : buttonColor , // Use light mode color
              width: borderWidth,
            ),
            color: settingscontroller.isDarkMode.value
                ? Colors.black54 // Use dark mode color
                : containerColor, // Use light mode color
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(icon,size:sizeicon,color: settingscontroller.isDarkMode.value
                    ? buttonColor // Use dark mode color
                    : primaryColor,) ,
                const SizedBox(width: 10,),
                Expanded(
                    child: MyCustomTextWidget(index: index, text: text)),
                const SizedBox(width: 40,),
                Icon(Icons.arrow_circle_right_outlined,
                    color: settingscontroller.isDarkMode.value
                        ? buttonColor // Use dark mode color
                        : primaryColor,  ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}