import 'package:elearning/view/screens/hiring_screen.dart';
import 'package:elearning/view/screens/inscription_screen.dart';
import 'package:elearning/view/screens/feedback_screen.dart';
import 'package:elearning/view/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/my_custom_container.dart';
class OnlineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(icon:Icon(Icons.arrow_back,color: buttonColor, ),onPressed: (){Get.back();}),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width,
                child: MyContainer(
                  gestuorTap:() => Get.to(() => Inscription()),
                  text: 'Inscription',
                  urlimage: 'assets/images/inscription.png',
                  borderRadius: 16.0,
                  borderColor: primaryColor,
                  borderWidth: 2.0,
                  index: 6,
                ),
              ),
              SizedBox(height: 30,),
              MyContainer(
                gestuorTap:() => Get.to(() => Hiring()),
                text: 'Hiring',
                urlimage: 'assets/images/hiring.png',
                borderRadius: 16.0,
                borderColor: buttonColor,
                borderWidth: 2.0,
                index: 6,
              ),
              SizedBox(height: 30,),
              MyContainer(
                gestuorTap:() => Get.to(() => FeedBack()),
                text: 'Feedback',
                urlimage: 'assets/images/feedback.png',
                borderRadius: 16.0,
                borderColor: primaryColor,
                borderWidth: 2.0,
                index: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
