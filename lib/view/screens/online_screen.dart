import 'package:elearning/presenter/controller/online_controller.dart';
import 'package:elearning/view/screens/feedback_screen.dart';
import 'package:elearning/view/widgets/colors.dart';
import 'package:elearning/view/widgets/curve_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controller/home_controller.dart';
import '../../presenter/controller/settings_controller.dart';
import '../widgets/my_custom_container.dart';
class OnlineScreen extends StatelessWidget {
  final SettingsController settingsController = Get.put(SettingsController());
  final OnlineController onlineController = Get.put(OnlineController());
  final HomeController homeController = Get.put(HomeController());

  OnlineScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CurvedContainer(height: 130),
                Positioned(
                  top: 20,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_circle_left_outlined,
                      color: settingsController.isDarkMode.value
                          ? Colors.black54 // Use dark mode color
                          : Colors.white, // Use light mode color
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 90),
            Container(
              width: MediaQuery.of(context).size.width,
              child: MyContainer(
                gestuorTap: () => onlineController.showSignUpAlert(context,'Inscription'),
                text: 'Inscription',
                borderRadius: 16.0,
                borderColor: primaryColor,
                borderWidth: 2.0,
                index: 6,
              ),
            ),
            const SizedBox(height: 30),
            MyContainer(
              gestuorTap: () => onlineController.showSignUpAlert(context,'Hiring'),
              text: 'Hiring',
              borderRadius: 16.0,
              borderColor: buttonColor,
              borderWidth: 2.0,
              index: 6,
            ),
            const SizedBox(height: 30),
            MyContainer(
              gestuorTap: () => Get.to(() => FeedBack()),
              text: 'Feedback',
              borderRadius: 16.0,
              borderColor: primaryColor,
              borderWidth: 2.0,
              index: 6,
            ),
          ],
        ),
      ),
    );
  }
}
