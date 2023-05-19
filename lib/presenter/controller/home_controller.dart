import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeController extends GetxController {
  late ScrollController scrollController;
  Timer? timer;
  final name = ''.obs;
  final currentIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    loadUserName();
    scrollController = ScrollController();
    startTimer();
  }
  @override
  void onClose() {
    super.onClose();
    cancelTimer();
  }
  Future<void> loadUserName() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('userInformation')
          .doc(user.uid)
          .get();
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
    timer = Timer.periodic(Duration(seconds: 5), (_) {
      currentIndex.value++;
      final double maxWidth = scrollController.position.maxScrollExtent + Get.width;
      if (currentIndex.value * Get.width >= maxWidth) {
        // When we reach the end of the scroll view, scroll back to the beginning
        scrollController.animateTo(
          0.0,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
        currentIndex.value = 0;
      } else {
        // Scroll to the next item in the scroll view
        scrollController.animateTo(
          currentIndex.value * Get.width,
          duration: Duration(seconds: 1),
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
}