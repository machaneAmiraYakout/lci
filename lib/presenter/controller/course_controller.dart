import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CourseController extends GetxController {
  var courseList = <String>[].obs;
  var selectedCourseId = ''.obs;
  var selectedCourseName = ''.obs;
  var subCourseList = <String>[].obs;
  RxList<String> filteredSubcourses = <String>[].obs;
  var selectedSubCourseId = ''.obs;
  RxBool isGridTapped = false.obs;
  var currentGridTappedIndex = Rx<int>(-1);
  final isConnected = true.obs;
  RxBool showAllCourses = false.obs;
  RxBool hasNewCourses = false.obs;
  TextEditingController searchController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    fetchCourses();
    checkConnectivity();
    Connectivity().onConnectivityChanged.listen((result) {
      isConnected.value = (result != ConnectivityResult.none);
    });
  }
  Future<void> fetchCourses() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance.collection('courses').get();
      querySnapshot.docs.forEach((doc) {
        courseList.add(doc.id);
      });
      if (courseList.isNotEmpty) {
        selectedCourseId.value = courseList[0];
        selectedCourseName.value = courseList[0];
        print('courses: $courseList');
      }
      await fetchSubCourses(selectedCourseId.value); // Call fetchSubCourses after updating course values
      update();
    } catch (e) {
      print('Error fetching courses: $e');
    }
  }
  Future<void> fetchSubCourses(String selectCourse) async {
    try {
      subCourseList.clear();
      final subcollectionsSnapshot = await FirebaseFirestore.instance
          .collection('courses')
          .doc(selectCourse)
          .collection('subcourses')
          .get();

      for (final doc in subcollectionsSnapshot.docs) {
        final subCourseName = doc.id;
        subCourseList.add(subCourseName);
        final lectures = await fetchLectures(selectCourse, subCourseName);
        print(' Lectures for subcourse Lectures for subcourse Lectures for subcourse $subCourseName: $lectures');
      }
      if (subCourseList.isNotEmpty) {
        selectedSubCourseId.value = subCourseList[0];
      }
      update();
    } catch (e) {
      print('Error fetching subcourses: $e');
    }
  }
  Future<List<Map<String, dynamic>>> fetchLectures(String course, String subCourse) async{
    try {
      final lecturesSnapshot = await FirebaseFirestore.instance
          .collection('courses')
          .doc(course)
          .collection('subcourses')
          .doc(subCourse)
          .collection('lectures')
          .get();
      final lectures = lecturesSnapshot.docs.map((doc) => doc.data()).toList();
      print('lectures lectures lectures lectures lectures lectures lectures lectures lectures lectures: $lectures');

      return lectures;
    } catch (e) {
      print('Error fetching lectures: $e');
      rethrow;
    }
  }
  void onCourseSelected(String? courseId) {
    if (courseId != null) {
      selectedCourseId.value = courseId;
      selectedCourseName.value = courseId;
      fetchSubCourses(selectedCourseId.value);
    }
  }
  void onSubCourseSelected(String? subCourseId) {
    if (subCourseId != null) {
      selectedSubCourseId.value = subCourseId;
      print('subcourse selected: $subCourseId');
    }
  }
  void setGridTapped(bool value, int index) {
    isGridTapped.value = value;
    currentGridTappedIndex.value = index;
  }
  void resetGridTapped() {
    isGridTapped.value = false;
    currentGridTappedIndex.value = -1;
  }
  Future<void> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    isConnected.value = (connectivityResult != ConnectivityResult.none);
  }
  void search(String keyword) {
    if (keyword.isEmpty) {
      filteredSubcourses.assignAll(courseList);
    } else {
      filteredSubcourses.assignAll(
        courseList.where((course) => course.toLowerCase().contains(keyword.toLowerCase())),
      );
    }
  }
}