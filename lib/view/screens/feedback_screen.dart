import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controller/feedback_controller.dart';
import '../widgets/colors.dart';
import '../widgets/my_custom_button.dart';
import '../widgets/my_custom_text.dart';
import '../widgets/my_custom_textfield.dart';
class FeedBack extends StatelessWidget {
  final FeedbackController feedbackController = Get.put(FeedbackController());
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
                color: Colors.white,
              ),
              Stack(children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        primaryColor,
                        primaryColor,
                        thirdColor,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 25,
                  child: Column(children: [
                    Image.asset('assets/images/lgb.png',width: 50,height: 50,),
                    MyCustomTextWidget(index: 13,text:'Lci groupe' ,),
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
                    color: Colors.white,
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