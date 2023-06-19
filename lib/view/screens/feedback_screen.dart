import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controller/feedback_controller.dart';
import '../../presenter/controller/settings_controller.dart';
import '../widgets/colors.dart';
import '../widgets/my_custom_button.dart';
import '../widgets/my_custom_text.dart';
import '../widgets/my_custom_textfield.dart';
class FeedBack extends StatelessWidget {
  final FeedbackController feedbackController = Get.put(FeedbackController());
  final SettingsController settingscontroller = Get.put(SettingsController());
  FeedBack({Key? key}) : super(key: key);
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
                  right: 10,
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
                top: 150,
                left: 30,
                right: 30,
                child: Container(
                  height: 400,
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
                              index: 11, text: 'Feedback Form'),
                          const SizedBox(height: 20),
                          DefaultTextField(
                            type: TextInputType.text,
                            hintText: 'Name',
                            prefixIcon: const Icon(Icons.person),
                            controller:
                            feedbackController.fullNameController,
                          ),
                          const SizedBox(height: 10),
                          DefaultTextField(
                            type: TextInputType.number,
                            hintText: 'Mobile',
                            prefixIcon: const Icon(Icons.phone),
                            controller: feedbackController.mobileController,
                          ),
                          const SizedBox(height: 10),
                          DefaultTextField(
                            type: TextInputType.text,
                            hintText: 'Object',
                            prefixIcon: const Icon(Icons.comment),
                            controller:
                            feedbackController.objectController,
                          ),
                          const SizedBox(height: 40),
                          CustomButton(
                            onPressed: () {
                              feedbackController.feedbachInfo();
                              feedbackController.clearTextFields();
                            },
                            text: 'submit',
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