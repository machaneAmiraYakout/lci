import 'package:elearning/view/widgets/colors.dart';
import 'package:elearning/view/widgets/my_custom_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: buttonColor, // Set the color of the drawer icon
        ),
      ),
      drawer: Drawer(
          child: ListView(
            children:  <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Container(
                height: 70,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0),
                  color: buttonColor.withOpacity(0.4),
                ),
                  child: Image.asset('assets/images/graduated.png'),
              ),
              ),
              ListTile(
                leading: const Icon(Icons.account_circle,color: thirdColor),
                title: MyCustomTextWidget(index:6 ,text: 'Profile'),
              ),
              ListTile(
                leading: const Icon(Icons.info,color: thirdColor),
                title: MyCustomTextWidget(index:6 ,text: 'Presentation'),
              ),
              ListTile(
                leading: const Icon(Icons.mode_edit_outline_rounded,color: thirdColor),
                title: MyCustomTextWidget(index:6 ,text: 'Edito'),
              ),
              ListTile(
                leading: const Icon(Icons.high_quality,color: thirdColor),
                title: MyCustomTextWidget(index:6 ,text: 'Valeurs'),
              ),
              ListTile(
                leading: const Icon(Icons.emoji_objects,color: thirdColor),
                title: MyCustomTextWidget(index:6 ,text: 'Objectifs'),
              ),
              ListTile(
                leading: const Icon(Icons.boy,color: thirdColor),
                title: MyCustomTextWidget(index:6 ,text: 'Partners'),
              ),
              ListTile(
                leading: const Icon(Icons.settings,color: thirdColor),
                title: MyCustomTextWidget(index:6 ,text: 'Settings'),
              ),
            ],
          ),
        ),

    );
  }
}
