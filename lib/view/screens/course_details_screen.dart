import 'package:elearning/presenter/controller/home_controller.dart';
import 'package:elearning/view/screens/inscription_screen.dart';
import 'package:elearning/view/widgets/colors.dart';
import 'package:elearning/view/widgets/my_custom_button.dart';
import 'package:elearning/view/widgets/my_custom_container.dart';
import 'package:elearning/view/widgets/my_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controller/course_controller.dart';
import '../../presenter/controller/settings_controller.dart';
class CourseDetails extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final SettingsController settingscontroller = Get.put(SettingsController());
  final CourseController courseController = Get.put(CourseController());

  String img;
  final String subCourseName;
  String lectures;
  String time;
  String description;
  String code;
  CourseDetails({Key? key, required this.img, required this.subCourseName,
    required this.lectures,required this.time,required this.description,required this.code}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          courseController.resetGridTapped();
          return true; // Return true to allow the back navigation
        },
        child: Scaffold(
      appBar: AppBar(

          leading:   IconButton(
          onPressed: () {
            Get.back();
            courseController.resetGridTapped();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: buttonColor,
          )),),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Container(
                   width: 90,
                   height: 70,
                   decoration: BoxDecoration(
                     color: settingscontroller.isDarkMode.value
                         ? primaryColor // Use dark mode color
                         : Colors.white, // Use light mode color
                     borderRadius: BorderRadius.circular(20),
                     border: Border.all( color: settingscontroller.isDarkMode.value
                         ? Colors.black // Use dark mode color
                         : buttonColor, // Use light mode color
                      ),
                   ),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       MyCustomTextWidget(text:'Réf',index:2),
                       const SizedBox(height: 5),
                       MyCustomTextWidget(text:code ,index:2),
                     ],
                   ),
                 ),
                 Center(child:
                 Image.asset('assets/images/$img.png',width: 280,height: 260,)),
                 Center(child:
                 MyCustomTextWidget(text:subCourseName,index:1,),),
                 const SizedBox(height: 50,),
                  MyCustomTextWidget(text:description ,index:2),
                 const SizedBox(
                   height: 40,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Expanded(
                       child: Container(
                         height: MediaQuery.of(context).size.width * 0.35,
                         constraints: BoxConstraints(maxWidth: 170),
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20),
                           color: settingscontroller.isDarkMode.value
                               ? Colors.black54 // Use dark mode color
                               : Colors.white, // Use light mode color
                           boxShadow: [
                             BoxShadow(
                               color: settingscontroller.isDarkMode.value
                                   ? Colors.black54 // Use dark mode color
                                   : primaryColor.withOpacity(0.5), // Use light mode color,
                               spreadRadius: 1,
                               blurRadius: 8,
                             ),
                           ],
                         ),
                         child: Padding(
                           padding: const EdgeInsets.all(10),
                           child: Center(
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 MyCustomTextWidget(text: time, index: 1),
                                 const Divider(height: 30, endIndent: 50, indent: 50, thickness: 5, color: buttonColor),
                                 MyCustomTextWidget(text: 'Theory and', index: 4),
                                 MyCustomTextWidget(text: 'Practices', index: 4),
                               ],
                             ),
                           ),
                         ),
                       ),
                     ),
                     const SizedBox(
                         width: 20),
                     Expanded(
                       child: Container(
                         height: MediaQuery.of(context).size.width * 0.35,
                         constraints: BoxConstraints(maxWidth: 170),
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20),
                           color: settingscontroller.isDarkMode.value
                               ? Colors.black54 // Use dark mode color
                               : Colors.white, // Use light mode color
                           boxShadow: [
                             BoxShadow(
                               color: settingscontroller.isDarkMode.value
                                   ? Colors.black54 // Use dark mode color
                                   : primaryColor.withOpacity(0.5), // Use light mode color,
                               spreadRadius: 1,
                               blurRadius: 8,
                             ),
                           ],
                         ),
                         child: Padding(
                           padding: const EdgeInsets.all(10),
                           child: Center(
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 MyCustomTextWidget(text: lectures, index: 1),
                                 const Divider(height: 40, endIndent: 50, indent: 50, thickness: 5, color: buttonColor),
                                 const SizedBox(height: 15),
                                 MyCustomTextWidget(text: 'Lectures', index: 4),
                               ],
                             ),
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
                 const SizedBox(
                   height: 30,),
                 CustomButton(
                   onPressed: () {
                     Get.to(() => Inscription());
                   },
                   text: 'Subscribe Now',
                   primary: buttonColor,
                   onPrimary: Colors.white,
                   sideColor: buttonColor,
                 ),
            ],
          ),
        )),
      ),
    ));
  }
}
