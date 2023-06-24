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
        title: Obx(() =>Row(
          children: [
             Icon(Icons.settings, color: settingscontroller.isDarkMode.value
                  ? buttonColor// Use dark mode color
                  : primaryColor,),
             SizedBox(width: 20,),
             Text(
              'Settings',
              style: TextStyle(
                color: settingscontroller.isDarkMode.value
                    ? buttonColor// Use dark mode color
                    : primaryColor, // Use light mode color
              ),
            ),
          ],
        )),
      ),
      body: GetBuilder<SettingsController>(
        init: SettingsController(),
        builder: (controller) => GetBuilder<SettingsController>(
          builder: (settingsController) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 20),
            child: Column(
              children: [
                Obx(
                        () =>
                    Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color:  settingsController.isDarkMode.value
                          ? buttonColor// Use dark mode color
                          : primaryColor,
                      width: 1.0,
                    ),
                    color: settingsController.isDarkMode.value
                        ? Colors.black54 // Use dark mode color
                        : Colors.white, // Use light mode color
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                  child: Center(
                    //responsive
                    child:  LayoutBuilder(
                      builder: (context, constraints) {
                        final isSmallScreen = constraints.maxWidth < 600;

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.dark_mode,
                              size: isSmallScreen ? 40 : 50,
                              color: settingsController.isDarkMode.value
                                  ? buttonColor // Use dark mode color
                                  : primaryColor, // Use light mode color
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Dark Mode:',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.25,),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  children: [
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
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                                    Obx(
                                          () => Text(
                                        settingsController.isDarkMode.value ? 'On' : 'Off',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: settingsController.isDarkMode.value
                                              ? buttonColor
                                              : primaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                )),
                const SizedBox(
                    height: 30),
                // Obx(
                //         () => Container(
                //   width: double.infinity,
                //   height: 80,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(20),
                //     border: Border.all(
                //       color:  settingsController.isDarkMode.value
                //           ? buttonColor// Use dark mode color
                //           : primaryColor,
                //       width: 1.0,
                //     ),
                //     color: settingsController.isDarkMode.value
                //         ? Colors.black54 // Use dark mode color
                //         : Colors.white, // Use light mode color
                //   ),
                //   padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                //   child: Center(
                //     child: LayoutBuilder(
                //       builder: (context, constraints) {
                //         final isSmallScreen = constraints.maxWidth < 600;
                //
                //         return Row(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children: [
                //             Icon(
                //               Icons.language,
                //               size: isSmallScreen ? 40 : 50,
                //               color: settingsController.isDarkMode.value
                //                   ? buttonColor // Use dark mode color
                //                   : primaryColor, // Use light mode color
                //             ),
                //             const SizedBox(width: 10),
                //             const Text(
                //               'Languages:',
                //               style: TextStyle(
                //                 fontSize: 18,
                //               ),
                //             ),
                //             const SizedBox(width: 10),
                //             Expanded(
                //               child: Align(
                //                 alignment: Alignment.centerRight,
                //                 child: Container(
                //                   decoration: BoxDecoration(
                //                     borderRadius: BorderRadius.circular(10),
                //                     border: Border.all(
                //                       color: settingsController.isDarkMode.value
                //                           ? buttonColor // Use dark mode color
                //                           : primaryColor, // Use light mode color
                //                       width: 1.0,
                //                     ),
                //                   ),
                //                   padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 4.0 : 8.0),
                //                   child: DropdownButton<String>(
                //                     value: settingsController.selectedLanguage.value,
                //                     onChanged: (value) {
                //                       settingsController.changeLanguage(value!);
                //                     },
                //                     items: const [
                //                       DropdownMenuItem<String>(
                //                         value: 'English',
                //                         child: Text('English'),
                //                       ),
                //                       DropdownMenuItem<String>(
                //                         value: 'French',
                //                         child: Text('French'),
                //                       ),
                //                       DropdownMenuItem<String>(
                //                         value: 'Arabic',
                //                         child: Text('Arabic'),
                //                       ),
                //                     ],
                //                     underline: SizedBox(),
                //                     icon: Icon(Icons.arrow_drop_down),
                //                     style: TextStyle(
                //                       fontSize: isSmallScreen ? 14 : 18,
                //                       color: settingsController.isDarkMode.value ? Colors.white : Colors.black,
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ],
                //         );
                //       },
                //     )
                //
                //   ),
                // )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}