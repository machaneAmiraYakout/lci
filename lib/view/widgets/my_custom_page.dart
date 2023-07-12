import 'package:elearning/view/widgets/colors.dart';
import 'package:elearning/view/widgets/my_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controller/settings_controller.dart';
class CustomPage extends StatelessWidget {
  final SettingsController settingsController = Get.put(SettingsController());
  final String title;
  final String text;
  final String? imagePath; // Optional image path
   CustomPage({
    Key? key,
    required this.title,
    required this.text,
    this.imagePath,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Container(
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                      onPressed: (){
                        Get.back();
                      },
                      icon:  Icon(Icons.arrow_circle_left_outlined,
                        color: settingsController.isDarkMode.value
                            ? buttonColor // Use dark mode color
                            : primaryColor , // Use light mode color
                        size: 30,)
                  ),
                const SizedBox(height: 20),
                if (imagePath != null) // Conditionally render the image
                  Image.asset(
                    imagePath!,
                    width: MediaQuery.of(context).size.width * 0.90,
                    height: MediaQuery.of(context).size.width * 0.6,
                    // You can customize the image dimensions as needed
                  ),
                if (imagePath != null)
                  const SizedBox(height: 20),
                MyCustomTextWidget(index: 1, text: title),
                const SizedBox(height: 100),
                Column(
                  children: text.split("\n\n").map((e) => Text(
                    e,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: subTitleTextColor,
                    ),
                  )).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}