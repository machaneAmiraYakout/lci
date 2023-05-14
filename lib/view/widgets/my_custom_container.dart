import 'package:flutter/material.dart';
import 'my_custom_text.dart';
class MyContainer extends StatelessWidget {
  final String text;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final String urlimage;
  final Color containerColor;
  final int index;
  final double widthImage;
  final double heightImage;
  GestureTapCallback? gestuorTap;
  final double? widthContainer;
  MyContainer({
    required this.text,
    this.borderRadius = 20.0,
    this.borderColor = Colors.grey,
    this.borderWidth = 1.0,
    required this.urlimage,
    required this.index,
    this.containerColor=Colors.white,
    this.gestuorTap,
     this.widthImage=150,
     this.heightImage=150,  this.widthContainer,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 30),
      child:GestureDetector(
        onTap: gestuorTap,
        child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
          color: containerColor,
        ),
        child: Row(
          children: [
            Image.asset(urlimage,width: widthImage,height:heightImage,),
            SizedBox(width: 30,),
            MyCustomTextWidget(index: index,text:text, ),
          ],
        ),
      ),),
    );
  }
}
