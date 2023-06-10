import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controller/hiring_controller.dart';
import '../widgets/colors.dart';
import '../widgets/my_custom_button.dart';
import '../widgets/my_custom_text.dart';
import '../widgets/my_custom_textfield.dart';

class Hiring extends StatelessWidget {
  final HiringController hiringController = Get.put(HiringController());
  Hiring({Key? key}) : super(key: key);
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
                top: 120,
                left: 30,
                right: 30,
                child: Container(
                  height: 530,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
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
                              index: 12, text: 'Application for Recruitment'),
                          const SizedBox(height: 20),
                          DefaultTextField(
                            type: TextInputType.text,
                            hintText: 'Full Name',
                            prefixIcon: const Icon(Icons.person),
                            controller: hiringController.fullNameController,
                          ),
                          const SizedBox(height: 10),
                          DefaultTextField(
                            type: TextInputType.none,
                            hintText: 'Date of birth',
                            prefixIcon: const Icon(Icons.date_range),
                            controller: hiringController.birthdayController,
                            onPressed: () async {
                              await hiringController.pickDate(context);
                            },
                          ),
                          const SizedBox(height: 10),
                          DefaultTextField(
                            type: TextInputType.text,
                            hintText: 'Current address ',
                            prefixIcon: const Icon(Icons.location_on),
                            controller: hiringController.addressController,
                          ),
                          const SizedBox(height: 10),
                          DefaultTextField(
                            type: TextInputType.text,
                            hintText: 'Email',
                            prefixIcon: const Icon(Icons.email),
                            controller: hiringController.emailController,
                          ),
                          const SizedBox(height: 10),
                          DefaultTextField(
                            type: TextInputType.phone,
                            hintText: 'Phone',
                            prefixIcon: const Icon(Icons.phone),
                            controller: hiringController.mobileController,
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              hiringController.selectFile();
                            },
                            child: Row(
                              children: [
                                Image.asset('assets/images/pdf.png',width: 40, height: 40),
                                const SizedBox(width: 10),
                                MyCustomTextWidget(text: 'Upload your CV(Choose a pdf File)', index: 2),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomButton(
                            onPressed: () async{await hiringController.submitForm();},
                            text: 'Apply',
                            primary: buttonColor,
                            onPrimary: Colors.white,
                            sideColor: buttonColor,
                          ),
                        ],
                      ),//hi
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
