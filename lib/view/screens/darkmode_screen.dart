import 'package:elearning/view/screens/started_screen.dart';
import 'package:elearning/view/widgets/colors.dart';
import 'package:elearning/view/widgets/my_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controller/settings_controller.dart';
class DarkModeScreen extends StatelessWidget {
  final SettingsController settingscontroller = Get.put(SettingsController());
   DarkModeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: settingscontroller.isDarkMode.value
                        ? Colors.black12 // Use dark mode color
                        : Colors.white, // Use light mode color
                    boxShadow: [
                      BoxShadow(
                        color: settingscontroller.isDarkMode.value
                            ? Colors.black54 // Use dark mode color
                            : primaryColor.withOpacity(0.5), // Use light mode color
                        spreadRadius: 1,
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child:Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/images/light.jpg',
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.15,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color:Colors.black54 // Use dark mode color
                          , // Use light mode color
                      boxShadow: [
                        BoxShadow(
                          color: settingscontroller.isDarkMode.value
                              ? Colors.black54 // Use dark mode color
                              : Colors.black12, // Use light mode color
                          spreadRadius: 1,
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Image.asset(
                            'assets/images/dark.jpg',
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.height * 0.15,
                            fit: BoxFit.contain,
                          ),
                        ),

                  ),
              ],
            )),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
            Obx(() => Switch(
                value: settingscontroller.isDarkMode.value,
                onChanged: (value) {
                  settingscontroller.toggleTheme();
                },
                activeColor: buttonColor,
                inactiveThumbColor: primaryColor,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.35,),
            CustomButton(
              onPressed: () {
                Get.to(() =>  const StartScreen());
              },
              text: 'Continue',
              primary: buttonColor,
              onPrimary: Colors.white,
              sideColor: buttonColor,
            ),
          ],
        ),
      ),
    );
  }
}
