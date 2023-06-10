import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/widgets/colors.dart';
class SettingsController extends GetxController {
  RxBool isDarkMode = false.obs;
  Rx<ThemeMode> currentThemeMode = ThemeMode.light.obs;
  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor, // Set your primary color
    primarySwatch: Colors.orange,
    inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)))
  );
  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: buttonColor, // Set your primary color
      primarySwatch: Colors.orange,
      inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)))
  );
  Rx<String> selectedLanguage = Rx<String>('English');
  void changeLanguage(String language) {
    selectedLanguage.value = language;
    // Implement language change logic here
  }
  void toggleThemeMode() {
    currentThemeMode.value =
    currentThemeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    Get.changeThemeMode(currentThemeMode.value);
  }
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
