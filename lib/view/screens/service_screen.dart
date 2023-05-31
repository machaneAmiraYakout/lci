import 'package:elearning/view/widgets/my_custom_text.dart';
import 'package:flutter/material.dart';
import '../widgets/colors.dart';
import '../widgets/curve_container.dart';
class Service extends StatelessWidget {
  const Service({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CurvedContainer(height: 130),
          MyCustomTextWidget(index: 1,text: 'Services'),
          Padding(padding: const EdgeInsets.only(left: 20,right: 20, top: 100),
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
                              blurRadius: 8),
                        ],
                      ),
                      child:  Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Image.asset('assets/images/formation.png',
                              width:120 ,
                              height: 100,
                              fit: BoxFit.contain,),
                          ),
                          const SizedBox(height: 20,),
                          MyCustomTextWidget(text:'Formation' ,index:5,),
                        ],
                      )
                  ),
                ),
                const SizedBox(width:20,),
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
                          margin: const EdgeInsets.all(10),
                          child: Image.asset('assets/images/advice.png',
                            width:120 ,
                            height: 120,
                            fit: BoxFit.contain,),
                        ),
                        MyCustomTextWidget(text:'Conseils' ,index:5,),
                      ],
                    ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical:20 ),
            child: Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow:[
                  BoxShadow(
                      color:primaryColor.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 8),],
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.asset('assets/images/tourisme.png',
                      width:150 ,
                      height: 150,
                      fit: BoxFit.contain,),
                  ),
                  MyCustomTextWidget(text:'Tourisme' ,index:5,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
