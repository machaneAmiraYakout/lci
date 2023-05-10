import 'package:elearning/presenter/controller/inscription_controller.dart';
import 'package:elearning/view/widgets/my_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/colors.dart';
import '../widgets/my_custom_textfield.dart';
class Inscription extends StatelessWidget {
  final InscriptionController inscriptionController = Get.put(InscriptionController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Container(
          width: double.infinity,
          height: 400,
          color:primaryColor ,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Container(

          ),
        )

        )

    );
  }
}
