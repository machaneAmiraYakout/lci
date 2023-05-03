import 'package:elearning/view/screens/feedback_screen.dart';
import 'package:elearning/view/screens/hiring_screen.dart';
import 'package:elearning/view/screens/inscription_screen.dart';
import 'package:elearning/view/widgets/colors.dart';
import 'package:flutter/material.dart';
import '../widgets/my_custom_container.dart';
class OnlineScreen extends StatelessWidget {
  const OnlineScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyContainer(
                gestuorTap: Inscription(),
                text: 'Inscription',
                urlimage: 'assets/images/inscription.png',
                borderRadius: 16.0,
                borderColor: primaryColor,
                borderWidth: 2.0,
                index: 6,
              ),
              SizedBox(height: 30,),
              MyContainer(
                gestuorTap: Hiring(),
                text: 'Hiring',
                urlimage: 'assets/images/hiring.png',
                borderRadius: 16.0,
                borderColor: buttonColor,
                borderWidth: 2.0,
                index: 6,
              ),
              SizedBox(height: 30,),
              MyContainer(
                gestuorTap: FeedBack(),
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
