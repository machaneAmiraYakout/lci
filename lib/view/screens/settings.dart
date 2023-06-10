import 'package:elearning/presenter/controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/colors.dart';
class Settings extends StatelessWidget {
  final SettingsController settingscontroller = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_circle_left_outlined, color: primaryColor),
            ),
            const Text(
              'Settings',
              style: TextStyle(
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
      body: GetBuilder<SettingsController>(
        init: SettingsController(),
        builder: (controller) => GetBuilder<SettingsController>(
          builder: (settingsController) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 20),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: primaryColor,
                      width: 1.0,
                    ),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                  child: Center(
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.dark_mode,
                          size: 40,
                          color: primaryColor,
                        ),
                         const SizedBox(width: 10),
                        const Text(
                          'Dark Mode:',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(width: 80),
                        Obx(
                              () => Switch(
                            value: settingsController.isDarkMode.value,
                            onChanged: (value) {
                              settingsController.toggleTheme();
                            },
                            activeColor: buttonColor,
                            inactiveThumbColor: primaryColor,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Obx(
                              () => Text(
                            settingsController.isDarkMode.value ? 'On' : 'Off',
                            style: TextStyle(
                              fontSize: 18,
                              color: settingsController.isDarkMode.value ? buttonColor : primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: primaryColor,
                      width: 1.0,
                    ),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.language,
                          size: 40,
                          color: primaryColor,
                        ),
                       const SizedBox(width: 10),
                        const Text(
                          'Languages:',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                       const SizedBox(width: 82),
                        Obx(
                              () => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: primaryColor,
                                width: 1.0,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DropdownButton<String>(
                              value: settingsController.selectedLanguage.value,
                              onChanged: (value) {
                                settingsController.changeLanguage(value!);
                              },
                              items: const [
                                DropdownMenuItem<String>(
                                  value: 'English',
                                  child: Text('English'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'French',
                                  child: Text('French'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Arabic',
                                  child: Text('Arabic'),
                                ),
                              ],
                              underline: SizedBox(),
                              icon: Icon(Icons.arrow_drop_down),
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
