import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class HomeController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  late ScrollController scrollController;
  List l=['appro','mark','exam','finance','import','computer','labo','language','management','mainte','humaine','tourisme'];
  Timer? timer;
  final name = ''.obs;
  final currentIndex = 0.obs;
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  @override
  void onInit() {
    super.onInit();
    loadUserName();
    scrollController = ScrollController();
    startTimer();
    configureFirebaseMessaging();
  }
  @override
  void onClose() {
    super.onClose();
    cancelTimer();
  }
  Future<void> loadUserName() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final docSnapshot = await FirebaseFirestore.instance.collection('userInformation').doc(user.uid).get();
      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        name.value = data['name'] ?? '';
        update();
        print('${name.value}gggggggggggggggggggg');
        print(data['name']);
      }
    }
  }
  void startTimer() {
    // Start the timer when the controller is initialized
    timer = Timer.periodic(const Duration(seconds: 5), (_) {
      currentIndex.value++;
      final double maxWidth = scrollController.position.maxScrollExtent + Get.width;
      if (currentIndex.value * Get.width >= maxWidth) {
        // When we reach the end of the scroll view, scroll back to the beginning
        scrollController.animateTo(
          0.0,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
        currentIndex.value = 0;
      } else {
        // Scroll to the next item in the scroll view
        scrollController.animateTo(
          currentIndex.value * Get.width,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      }
      // Access the position property of the ScrollController
      ScrollPosition position = scrollController.position;
      // Use the position object as needed
      print('Scroll position: ${position.pixels}');
      print('Scroll activity: ${position.activity}');
    });
  }
  void cancelTimer() {
    timer?.cancel();
    timer = null;
  }
  void configureFirebaseMessaging() async{
    // Request permission to receive notifications
    firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    // Configure the handlers for incoming messages and when the app is in the foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle the incoming message
      print('Received message: ${message.notification?.title}');
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handle the notification when the app is in the foreground
      print('User tapped on the notification');
    });
    // Get the device token
    String? deviceToken = await firebaseMessaging.getToken();
    // Print the device token
    print('Device token: $deviceToken');
    storeDeviceToken(deviceToken);

  }
  void storeDeviceToken(String? token) async {
    if (token != null) {
      // Get the reference to the Firestore collection where you want to store the tokens
      CollectionReference tokensRef = FirebaseFirestore.instance.collection('deviceTokens');
      // Create a new document with a unique identifier
      DocumentReference documentRef = tokensRef.doc();
      // Set the token in the document
      await documentRef.set({'token': token});
    }
  }
}