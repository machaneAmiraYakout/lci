import 'package:elearning/view/widgets/my_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controller/settings_controller.dart';
import '../widgets/colors.dart';
import '../widgets/curve_container.dart';
class Service extends StatelessWidget {
  const Service({super.key});
  @override
  Widget build(BuildContext context) {
    final SettingsController settingscontroller = Get.put(SettingsController());

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              CurvedContainer(height: 130),
              Positioned(
                  top: 20,
                  child: IconButton(
                      onPressed: (){
                        Get.back();
                      },
                      icon:  Icon(Icons.arrow_circle_left_outlined,
                        color: settingscontroller.isDarkMode.value
                            ? Colors.black54 // Use dark mode color
                            : Colors.white, // Use light mode color
                        size: 30,))),
            ],
          ),
          MyCustomTextWidget(index: 1,text: 'Services'),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              top: MediaQuery.of(context).size.height * 0.1,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                      color: settingscontroller.isDarkMode.value
                          ? Colors.black54 // Use dark mode color
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
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Image.asset(
                            'assets/images/formation.png',
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.15,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),

                        MyCustomTextWidget(text: 'Formation', index: 5),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),

                    color: settingscontroller.isDarkMode.value
                        ? Colors.black54 // Use dark mode color
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
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/images/advice.png',
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.15,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),

                      MyCustomTextWidget(text: 'Conseils', index: 5),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),

                color: settingscontroller.isDarkMode.value
                    ? Colors.black54 // Use dark mode color
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/images/tourisme.png',
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.15,
                      fit: BoxFit.contain,
                    ),
                  ),
                  MyCustomTextWidget(text: 'Tourisme', index: 5),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
