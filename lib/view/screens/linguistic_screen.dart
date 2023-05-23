import 'package:elearning/view/widgets/colors.dart';
import 'package:elearning/view/widgets/my_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Linguistic extends StatelessWidget {
  const Linguistic({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            GridView.count(
              crossAxisCount: 2,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
               // for(int i=0;i</l.length;i++)
                  Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      margin:EdgeInsets.symmetric(vertical:10 ,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow:[
                          BoxShadow(
                              color:primaryColor.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 8),],
                      ),
                      child:Column(
                        children: [
                          InkWell(
                            onTap:(){
                           //   Get.to(CourseDetails(img:'${homeController.l[i]}'));
                            } ,
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: Image.asset('assets/images//.png',
                                width:120 ,
                                height: 100,
                                fit: BoxFit.contain,),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 8,left: 10),
                            child: Container(
                              alignment:Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child:MyCustomTextWidget(text:'',index:5 )),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: buttonColor,)),
                                ],
                              ),
                            ),)
                        ],
                      ),
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
