import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controller/course_controller.dart';
import '../widgets/colors.dart';
import '../widgets/my_custom_textfield.dart';
class Search extends StatelessWidget {
  final CourseController searchController = Get.put(CourseController());
   Search({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back,
                size: 25,
                color: buttonColor,
              ),
            ),
            const SizedBox(height: 20,),
            DefaultTextField(
                hintText: 'search for course ',
                prefixIcon: const Icon(
                  Icons.search,
                  color: primaryColor,
                ),
                controller: searchController.searchController,
                type: TextInputType.text,
                onChange:  (value) => searchController.search(value),
              ),
            const SizedBox(height: 20.0),
            Expanded(
              child: Obx(
                    () => ListView.builder(
                  itemCount: searchController.filteredSubcourses.length,
                  itemBuilder: (context, index) {
                    final subCourse = searchController.filteredSubcourses[index];
                    return Container(
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: buttonColor)),
                      ),
                      child: ListTile(
                        title: Text(
                          subCourse,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
