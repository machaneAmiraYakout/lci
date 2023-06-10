import 'package:elearning/presenter/controller/home_controller.dart';
import 'package:elearning/view/screens/inscription_screen.dart';
import 'package:elearning/view/widgets/colors.dart';
import 'package:elearning/view/widgets/my_custom_button.dart';
import 'package:elearning/view/widgets/my_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CourseDetails extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  String img;
  final String subCourseName;
  CourseDetails({Key? key, required this.img, required this.subCourseName,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
          leading:   IconButton(
          onPressed: () {
            Get.back();
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
                 Center(child:
                 Image.asset('assets/images/$img.png',width: 280,height: 260,)),
                 Center(child:
                 MyCustomTextWidget(text:subCourseName,index:1,),),
                 const SizedBox(height: 10,),
                 MyCustomTextWidget(text:'s’iements s’iements s’iements s’iements  ' ,index:2),
                 MyCustomTextWidget(text:'s’iements s’iements s’iements s’iements  ' ,index:2),
                 MyCustomTextWidget(text:'s’iements s’iements s’iements s’iements  ' ,index:2),
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
                           color: Colors.white,
                           boxShadow: [
                             BoxShadow(
                               color: primaryColor.withOpacity(0.5),
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
                                 MyCustomTextWidget(text: '8 Hours', index: 1),
                                 const Divider(height: 30, endIndent: 50, indent: 50, thickness: 5, color: buttonColor),
                                 MyCustomTextWidget(text: 'Theory and', index: 4),
                                 MyCustomTextWidget(text: 'Practices', index: 4),
                               ],
                             ),
                           ),
                         ),
                       ),
                     ),
                     const SizedBox(width: 20),
                     Expanded(
                       child: Container(
                         height: MediaQuery.of(context).size.width * 0.35,
                         constraints: BoxConstraints(maxWidth: 170),
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20),
                           color: Colors.white,
                           boxShadow: [
                             BoxShadow(
                               color: primaryColor.withOpacity(0.5),
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
                                 MyCustomTextWidget(text: '17', index: 1),
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
    );
  }
}
