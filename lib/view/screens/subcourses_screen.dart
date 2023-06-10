import 'package:elearning/view/screens/course_details_screen.dart';
import 'package:elearning/view/widgets/colors.dart';
import 'package:elearning/view/widgets/curve_container.dart';
import 'package:elearning/view/widgets/my_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controller/course_controller.dart';
import '../../presenter/controller/home_controller.dart';
class SubCourses extends StatelessWidget {
  int index1;
  final HomeController homeController = Get.put(HomeController());
  final CourseController courseController = Get.put(CourseController());

  SubCourses({Key? key, required this.index1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        courseController.resetGridTapped();
        return true; // Return true to allow the back navigation
      },
      child: Scaffold(
        body: Obx(() {
          if (courseController.isConnected.value) {
            // Display the ListView when there is an internet connection
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      CurvedContainer(height: 130),
                      Positioned(
                        top: 20,
                        child: IconButton(
                            onPressed: () {
                              Get.back();
                              courseController.resetGridTapped();
                            },
                            icon: const Icon(
                              Icons.arrow_circle_left_outlined,
                              color: Colors.white,
                              size: 30,
                            )),
                      ),
                    ],
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: courseController.subCourseList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: InkWell(
                          onTap: () {
                            Get.to(CourseDetails(
                              img: homeController.l[index1],
                              subCourseName: courseController.subCourseList[index],
                            ));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
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
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            courseController.subCourseList[index],
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
                                        const Icon(
                                          Icons.arrow_circle_right,
                                          color: buttonColor,
                                          size: 35,
                                        ),
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
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            );
          }
          else {
            // Display the image when there is no internet connection
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/nocnnx.png',
                    width: 350,
                    height: 350,
                  ),
                  Column(
                    children: [
                    MyCustomTextWidget(text: 'No connection. Please check your connectivity', index: 13,),
                    const SizedBox(height: 20,),
                  ],),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
