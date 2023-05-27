import 'package:elearning/view/widgets/my_custom_text.dart';
import 'package:flutter/material.dart';

import '../widgets/colors.dart';
import '../widgets/curve_container.dart';

class Service extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CurvedContainer(height: 130),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap:(){

                  },
                  child: Container(
                      height: 180,
                      width: 175,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow:[
                          BoxShadow(
                              color:primaryColor.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 8),],
                      ),
                      child:  Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Image.asset('assets/images/lingue.png',
                              width:120 ,
                              height: 100,
                              fit: BoxFit.contain,),
                          ),
                          const SizedBox(height: 20,),
                          MyCustomTextWidget(text:'Linguistic' ,index:5,),
                        ],
                      )
                  ),
                ),
                SizedBox(width:20,),
                Container(
                    height: 180,
                    width: 175,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow:[
                        BoxShadow(
                            color:primaryColor.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 8),],
                    ),
                    child:  Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Image.asset('assets/images/tec.png',
                            width:120 ,
                            height: 120,
                            fit: BoxFit.contain,),
                        ),
                        MyCustomTextWidget(text:'Technical' ,index:5,),
                      ],
                    )
                ),
              ],),),// Include the CurvedContainer here
          // Other widgets for the screen
        ],
      ),
    );
  }
}
