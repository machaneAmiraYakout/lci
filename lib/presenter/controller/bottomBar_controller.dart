import 'package:elearning/view/screens/home_screen.dart';
import 'package:elearning/view/screens/new_courses.dart';
import 'package:elearning/view/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class BottomBarController extends GetxController {
  int selectedIndex = 0;
  final List<Widget> widgetOptions = <Widget>[
    HomeScreen(),
    NewCourses(),
    Settings(),
  ];
  void onItemTapped(int index) {
    selectedIndex = index;
    print('index selected $index');
    update();
  }

}
