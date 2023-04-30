import 'package:flutter/material.dart';

import 'my_custom_text.dart';
class MyContainer extends StatelessWidget {
  final String text;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final String urlimage;
  final int index;


  MyContainer({
    required this.text,
    this.borderRadius = 20.0,
    this.borderColor = Colors.grey,
    this.borderWidth = 1.0,
    required this.urlimage,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      child: Row(
        children: [
          Image.asset(urlimage,width: 200,height:200,),
          MyCustomTextWidget(index: index,text:text, ),
        ],
      ),
    );
  }
}
