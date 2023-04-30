import 'package:elearning/view/widgets/colors.dart';
import 'package:elearning/view/widgets/my_custom_text.dart';
import 'package:flutter/material.dart';
class CustomPage extends StatelessWidget {
  final String title;
  final String text;
  const CustomPage({required this.title, required this.text});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80,horizontal: 40),
          child:  Container(
              child: Column(
                children: [
                  MyCustomTextWidget(index:1 ,text: title),
                  SizedBox(height: 100,),
                  Column(
                    children: text.split("\n\n").map((e) =>  Text(e,style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: subTitleTextColor,
                    ),)).toList(),
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}