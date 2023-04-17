import 'package:elearning/view/screens/started_screen.dart';
import 'package:elearning/view/widgets/colors.dart';
import 'package:elearning/view/widgets/my_custom_button.dart';
import 'package:elearning/view/widgets/my_custom_text.dart';
import 'package:elearning/view/widgets/my_custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: ()=>Get.to(() =>   const StartScreen()),
                  icon: const Icon(Icons.arrow_back,size: 25,color: primaryColor,),),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 30),
                child: MyCustomTextWidget(text:'Welcome!' ,index: 1,),),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 30),
                child: MyCustomTextWidget(text:'Sign in to continue' ,index: 2,),),
              const SizedBox(height: 80,),
              DefaultTextField(onPressed:(){} ,
                hintText:'Enter your email' ,
                prefixIcon:const Icon(Icons.email,color: primaryColor,) ,
                controller: emailController,
                type:TextInputType.emailAddress,),
              const SizedBox(height: 70,),
              DefaultTextField(onPressed:(){} ,
                hintText:'Enter your email' ,
                prefixIcon:const Icon(Icons.lock,color: primaryColor,) ,
                controller: passWordController,
                type:TextInputType.visiblePassword,
              obscuretext: true),
              const SizedBox(height: 90,),
              CustomButton(onPressed: (){},text:'LOGIN' ,primary: buttonColor,
                onPrimary: Colors.white,sideColor:buttonColor ,),
              GestureDetector(child: Center(
                child: MyCustomTextWidget(text: 'Forget Password?',index: 3,),),),
              SizedBox(height: 80,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 40),
                child: GestureDetector(
                     onTap: ()=>Get.to(() =>    LoginScreen()),child: Row(children: [
                       MyCustomTextWidget(text: 'Don’t have an account?',index: 4,),
                       MyCustomTextWidget(text: 'Sign Up',index: 5,),

],)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
