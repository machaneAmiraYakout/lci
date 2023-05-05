import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../presenter/controller/bottomBar_controller.dart';
import '../widgets/colors.dart';
class BottomBar extends StatelessWidget {
  final BottomBarController bottomBarController = Get.put(BottomBarController());
   BottomBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:GetBuilder<BottomBarController>(
        init: BottomBarController(),
    builder: (bottomBarController) => bottomBarController.widgetOptions.elementAt(bottomBarController.selectedIndex)),
      bottomNavigationBar:GetBuilder<BottomBarController>(
        init: BottomBarController(),
        builder: (bottomBarController) =>  BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school_outlined),
              label: 'New Courses',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: bottomBarController.selectedIndex,
          selectedItemColor: buttonColor,
          unselectedItemColor:primaryColor,
          onTap:bottomBarController.onItemTapped,
        ),),

    );
  }
}
