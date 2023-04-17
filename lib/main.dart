import 'package:elearning/view/screens/home_page.dart';
import 'package:elearning/view/screens/started_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'ELearning',
      debugShowCheckedModeBanner: false,

      home:  StartScreen(),
    );
  }
}

