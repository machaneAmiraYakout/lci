import 'package:elearning/presenter/cache_helper.dart';
import 'package:elearning/view/screens/BottomBar_screen.dart';
import 'package:elearning/view/screens/home_page.dart';
import 'package:elearning/view/screens/signup_screen.dart';
import 'package:elearning/view/screens/splash_screen.dart';
import 'package:elearning/view/screens/started_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await  Firebase.initializeApp();
  String? token='';
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
    ));

}

