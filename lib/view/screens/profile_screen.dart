import 'package:elearning/presenter/controller/home_controller.dart';
import 'package:elearning/view/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controller/profile_controller.dart';
import '../../presenter/controller/settings_controller.dart';
import '../widgets/my_custom_text.dart';
class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());
    final HomeController homeController = Get.put(HomeController());
    final screenHeight = MediaQuery.of(context).size.height;
    final SettingsController settingscontroller = Get.put(SettingsController());
    return GestureDetector(
        onTap: () {
          // hide keyboard when user taps outside of textfield
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                color: settingscontroller.isDarkMode.value
                    ? Colors.black54 // Use dark mode color
                    : Colors.white, // Use light mode color
              ),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          settingscontroller.isDarkMode.value ? Colors.black54 : Colors.white,
                          settingscontroller.isDarkMode.value ? Colors.black : primaryColor,
                          settingscontroller.isDarkMode.value ? Colors.black : secondColor,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 25,
                    top: 25,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_circle_left_outlined,
                            color: settingscontroller.isDarkMode.value
                                ? buttonColor // Use dark mode color
                                : Colors.white, // Use light mode color
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.65,
                        ),
                        Image.asset(
                          'assets/images/lgb.png',
                          width: 50,
                          height: 50,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                top: 120,
                left: 30,
                right: 30,
                child: Container(
                  height: 530,
                  decoration: BoxDecoration(
                    color: settingscontroller.isDarkMode.value
                        ? Colors.black54 // Use dark mode color
                        : Colors.white, // Use light mode color
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 78,
                          ),
                          settingscontroller.isDarkMode.value
                              ? const CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.black26,
                              backgroundImage: AssetImage('assets/images/utilisateur.png'))
                              : const CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage('assets/images/utilisateur1.png')),
                          MyCustomTextWidget(index: 1, text: 'User Name '),
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Obx(() {
                              if (profileController.isEditing.value) {
                                return TextField(
                                  onChanged: (newValue) {
                                    profileController.updateUserName(newValue);
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Name',
                                  ),
                                );
                              } else {
                                return Text(
                                  homeController.name.value,
                                  style: const TextStyle(fontSize: 20.0),
                                );
                              }
                            }),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Obx(() {
                              if (profileController.isEditing.value) {
                                return TextField(
                                  onChanged: (newValue) {
                                    // Implement a method in the profileController to update the password
                                    profileController.updatePassword(newValue);
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Password',
                                  ),
                                  obscureText: true,
                                );
                              } else {
                                return Text(
                                  '********', // Display password as asterisks or any other placeholder
                                  style: const TextStyle(fontSize: 20.0),
                                );
                              }
                            }),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: screenHeight * 0.05,
                            width: screenHeight * 0.3,
                            child: ElevatedButton(
                              onPressed: profileController.toggleEditing,
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              child: Obx(() {
                                return Text(
                                  profileController.isEditing.value ? 'Save' : 'Edit',
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}