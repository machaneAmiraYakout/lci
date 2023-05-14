import 'package:elearning/presenter/cache_helper.dart';
import 'package:elearning/view/screens/BottomBar_screen.dart';
import 'package:elearning/view/screens/splash_screen.dart';
import 'package:elearning/view/widgets/colors.dart';
import 'package:elearning/view/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  //hiby
  WidgetsFlutterBinding.ensureInitialized();
  await  Firebase.initializeApp();
   token='';
   token=await CacheHelper.importData(key: 'token');
   print(token);
  Widget startedScreen;
  if(token==null){
    startedScreen= SplashScreen() ;
  }
  else{
    startedScreen= BottomBar();
  }
  runApp(   GetMaterialApp(
      title: 'ELearning',
      debugShowCheckedModeBanner: false,
      home:  startedScreen,
    theme: ThemeData(
      primarySwatch: Colors.orange,
      inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)))
    ),

    ));
}

