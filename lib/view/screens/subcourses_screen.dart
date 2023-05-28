import 'package:elearning/view/screens/course_details_screen.dart';
import 'package:elearning/view/widgets/colors.dart';
import 'package:elearning/view/widgets/curve_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controller/course_controller.dart';
import '../../presenter/controller/home_controller.dart';
class SubCourses extends StatelessWidget {
  int index1;
  final HomeController homeController = Get.put(HomeController());
  final CourseController courseController = Get.put(CourseController());
   SubCourses({Key? key,required this.index1}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:SingleChildScrollView(
        child:  Column(
          children: [
            CurvedContainer(height: 130),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: courseController.subCourseList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    onTap: (){
                      Get.to(CourseDetails(img: homeController.l[index1],
                        subCourseName: '${courseController.subCourseList[index]}',));

                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${courseController.subCourseList[index]}',
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: primaryColor,
                                        letterSpacing: 2,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                 Icon(Icons.arrow_circle_right, color: buttonColor,size: 35,),

                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 30,),
          ],
        )
      )
    );
  }
}
