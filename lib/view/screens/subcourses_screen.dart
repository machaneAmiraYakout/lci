import 'package:elearning/view/screens/course_details_screen.dart';
import 'package:elearning/view/widgets/colors.dart';
import 'package:elearning/view/widgets/curve_container.dart';
import 'package:elearning/view/widgets/my_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controller/course_controller.dart';
import '../../presenter/controller/home_controller.dart';
import '../../presenter/controller/settings_controller.dart';
class SubCourses extends StatelessWidget {
  final SettingsController settingscontroller = Get.put(SettingsController());
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
                            icon:  Icon(
                              Icons.arrow_circle_left_outlined,
                              color: settingscontroller.isDarkMode.value
                                  ? Colors.black54 // Use dark mode color
                                  : Colors.white, // Use light mode color
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
                          onTap: ()async {
                            courseController.setGridTapped(true, index);
                            //fetch lectures
                            final lectures = await courseController.fetchLectures(courseController.courseList[index1], courseController.subCourseList[index],);
                            final lecturesString = lectures.join(', ');
                            //fetch time
                            final time = await courseController.fetchTime(courseController.courseList[index1], courseController.subCourseList[index],);
                            final timeString = time.join(', ');
                            //fetch description
                            final description = await courseController.fetchLectures(courseController.courseList[index1], courseController.subCourseList[index],);
                            final descriptionsString = description.join(', ');
                            //fetch code
                            final code = await courseController.fetchCode(courseController.courseList[index1], courseController.subCourseList[index],);
                            final codeString = code.join(', ');
                            Get.to(CourseDetails(
                              img: homeController.l[index1],
                              subCourseName: courseController.subCourseList[index],
                              lectures: lecturesString,
                              time:timeString,
                              description:descriptionsString,
                              code:codeString,
                            ));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: settingscontroller.isDarkMode.value
                                  ? Colors.black54 // Use dark mode color
                                  : Colors.white, // Use light mode color

                              boxShadow: [
                                BoxShadow(
                                  color: settingscontroller.isDarkMode.value
                                      ? Colors.black54 // Use dark mode color
                                      :primaryColor.withOpacity(0.5),// Use light mode color
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
                                            style:  TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: settingscontroller.isDarkMode.value
                                                  ? Colors.white // Use dark mode color
                                                  :primaryColor,// Use light mode color
                                              letterSpacing: 2,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Obx(() => courseController.isGridTapped.value &&
                                            courseController.currentGridTappedIndex.value == index
                                            ? const SizedBox(
                                          width: 15,
                                          height: 15,
                                          child: CircularProgressIndicator(
                                            color: buttonColor,
                                            strokeWidth: 2.0,
                                          ),)
                                            : const Icon(Icons.arrow_circle_right,
                                          color: buttonColor,
                                        ),),
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
