import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controller/course_controller.dart';
import '../../presenter/controller/inscription_controller.dart';
import '../../presenter/controller/settings_controller.dart';
import '../widgets/colors.dart';
import '../widgets/my_custom_button.dart';
import '../widgets/my_custom_text.dart';
import '../widgets/my_custom_textfield.dart';
class Inscription extends StatelessWidget {
  final InscriptionController inscriptionController = Get.put(InscriptionController());
  final CourseController courseController = Get.put(CourseController());
  final SettingsController settingscontroller = Get.put(SettingsController());
  Inscription({super.key});
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
        onTap: () {
          // hide keyboard when user taps outside of textfield
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                color: settingscontroller.isDarkMode.value
                    ? Colors.black54 // Use dark mode color
                    : Colors.white, // Use light mode color
              ),
              Stack(children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration:  BoxDecoration(
                    gradient: LinearGradient(
                     colors: [
                       settingscontroller.isDarkMode.value ? Colors.black54 : Colors.white,
                       settingscontroller.isDarkMode.value ? Colors.black : primaryColor,
                       settingscontroller.isDarkMode.value ? Colors.black : secondColor,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned(
                  right: 25,
                  top: 25,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: (){Get.back();},
                          icon:  Icon(Icons.arrow_circle_left_outlined,
                            color: settingscontroller.isDarkMode.value
                                ? buttonColor // Use dark mode color
                                : Colors.white, // Use light mode color
                            size: 30,)),
                      SizedBox(width:MediaQuery.of(context).size.width * 0.65,),
                      Image.asset('assets/images/lgb.png',width: 50,height: 50,),
                    ]
                    ,),)
              ],),
              Positioned(
                top: 120,
                left: 30,
                right: 30,
                child: Container(
                  height: 600,
                  decoration: BoxDecoration(
                    color: settingscontroller.isDarkMode.value
                        ? Colors.black54 // Use dark mode color
                        : Colors.white, // Use light mode color
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius:1,
                        //offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyCustomTextWidget(
                              index: 11, text: 'Registration Form'),
                          const SizedBox(height: 20),
                          DefaultTextField(
                            type: TextInputType.text,
                            hintText: 'Name',
                            prefixIcon: const Icon(Icons.person),
                            controller:
                            inscriptionController.fullNameController,
                          ),
                          const SizedBox(height: 10),
                          DefaultTextField(
                            type: TextInputType.number,
                            hintText: 'Age',
                            prefixIcon: const Icon(Icons.accessibility),
                            controller: inscriptionController.ageController,
                          ),
                          const SizedBox(height: 10),
                          DefaultTextField(
                            type: TextInputType.text,
                            hintText: 'Fonction / Niveau',
                            prefixIcon: const Icon(Icons.work),
                            controller:
                            inscriptionController.fonctionController,
                          ),
                          const SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Obx(
                                  () => DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton<String>(
                                    value: courseController.selectedCourseId.value,
                                    hint: const Text('Select a course'),
                                    isExpanded: true,
                                    onChanged:(value){
                                      courseController.onCourseSelected(value);
                                      inscriptionController.courseDropdownValue=courseController.selectedCourseId.value;
                                    },
                                    items: courseController.courseList.map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text(value),
                                          ),
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Obx(
                                  () => DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton<String>(
                                    value: courseController.selectedSubCourseId.value,
                                    hint: const Text('Select a course'),
                                    isExpanded: true,
                                    onChanged: (value){
                                      courseController.onSubCourseSelected(value);
                                    inscriptionController.subCourseDropdownValue=courseController.selectedSubCourseId.value;
                                      },
                                    items:courseController.subCourseList.map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text(value),
                                          ),
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          DefaultTextField(
                            type: TextInputType.emailAddress,
                            hintText: 'Email',
                            prefixIcon: const Icon(Icons.email),
                            controller: inscriptionController.emailController,
                          ),
                          const SizedBox(height: 10),
                          DefaultTextField(
                            type: TextInputType.phone,
                            hintText: 'Mobile',
                            prefixIcon: const Icon(Icons.phone),
                            controller: inscriptionController.mobileController,
                          ),
                          const SizedBox(height: 10),
                          DefaultTextField(
                            type: TextInputType.text,
                            hintText: 'Commentaire',
                            prefixIcon: const Icon(Icons.comment),
                            controller:
                            inscriptionController.commentaireController,
                          ),
                          const SizedBox(height: 10),
                          CustomButton(
                            onPressed: ()async {
                              await inscriptionController.addInscriptionGuest();
                              inscriptionController.clearTextFields();
                            },
                            text: 'Register',
                            primary: buttonColor,
                            onPrimary: Colors.white,
                            sideColor: buttonColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}