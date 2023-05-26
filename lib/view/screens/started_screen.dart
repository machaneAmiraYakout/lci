import 'package:elearning/view/screens/guest_screen.dart';
import 'package:elearning/view/screens/login_screen.dart';
import 'package:elearning/view/screens/signup_screen.dart';
import 'package:elearning/view/widgets/colors.dart';
import 'package:elearning/view/widgets/my_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/my_custom_text.dart';
class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset('assets/images/lg.jpg', height: 40,width: 40,),
                  const SizedBox(width: 10,),
                  MyCustomTextWidget(index: 3,text: 'LCI Group' ,)
                ],
              ),
              Image.asset('assets/images/started.png'),
              MyCustomTextWidget(index:1 ,text:'Hello!' ,),
              const SizedBox(height: 10,),
              MyCustomTextWidget(index:2 ,text:'Welcome to LCI group,' ,),
              const SizedBox(height: 5,),
              MyCustomTextWidget(index:2 ,text:'where studying is made easy',),
              const SizedBox(height: 35,),
              CustomButton(text:'GUEST' ,onPressed:()=>Get.to(() =>GuestScreen()),sideColor: primaryColor,primary:primaryColor,onPrimary:Colors.white ),
              CustomButton(text:'LOGIN' ,onPressed:()=>Get.to(() =>LoginScreen()),sideColor: buttonColor,onPrimary:Colors.white ,primary:buttonColor ),
              CustomButton(text:'SIGNUP' ,onPressed:()=>Get.to(() =>SignupScreen()),sideColor: secondColor,primary: Colors.white,onPrimary:secondColor ),
            ],
          ),
        ),
      ),
    );
  }
}