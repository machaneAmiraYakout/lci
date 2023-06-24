import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CourseController extends GetxController {
  var courseList = <String>[].obs;
  var selectedCourseId = ''.obs;
  var selectedCourseName = ''.obs;
  var subCourseList = <String>[].obs;
  var lectureCourseList = <String>[].obs;
  var timeCourseList = <String>[].obs;
  var descriptionCourseList = <String>[].obs;
  RxList<String> filteredSubcourses = <String>[].obs;
  var selectedSubCourseId = ''.obs;
  RxBool isGridTapped = false.obs;
  var currentGridTappedIndex = Rx<int>(-1);
  final isConnected = true.obs;
  RxBool showAllCourses = false.obs;
  RxBool hasNewCourses = false.obs;
  RxList lectures = [].obs;
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
  Future<void> fetchSubCourses( String selectCourse) async {
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
      }
      if (subCourseList.isNotEmpty) {
        selectedSubCourseId.value = subCourseList[0];
      }
      update();
    } catch (e) {
      print('Error fetching subcourses: $e');
    }
  }
  Future<List<String>> fetchLectures(String selectCourse, String selectedSubCourse) async {
    lectureCourseList.clear();
    try {
      final lecturecollectionsSnapshot = await FirebaseFirestore.instance
          .collection('courses')
          .doc(selectCourse)
          .collection('subcourses')
          .doc(selectedSubCourse)
          .collection('lectures')
          .get();
      for (final doc in lecturecollectionsSnapshot.docs) {
        final lectureCourseName = doc.id;
        lectureCourseList.add(lectureCourseName);
      }
      update();
      return lectureCourseList;
    } catch (e) {
      print('Error fetching lectures: $e');
      return [];
    }
  }
  Future<List<String>> fetchTime(String selectCourse, String selectedSubCourse) async {
    timeCourseList.clear();
    try {
      final timecollectionsSnapshot = await FirebaseFirestore.instance
          .collection('courses')
          .doc(selectCourse)
          .collection('subcourses')
          .doc(selectedSubCourse)
          .collection('time')
          .get();
      for (final doc in timecollectionsSnapshot.docs) {
        final timeCourseName = doc.id;
        timeCourseList.add(timeCourseName);
      }
      update();
      return timeCourseList;
    } catch (e) {
      print('Error fetching lectures: $e');
      return ['no Cnnx'];
    }
  }
  Future<List<String>> fetchDescription(String selectCourse, String selectedSubCourse) async {
    descriptionCourseList.clear();
    try {
      final descriptioncollectionsSnapshot = await FirebaseFirestore.instance
          .collection('courses')
          .doc(selectCourse)
          .collection('subcourses')
          .doc(selectedSubCourse)
          .collection('description')
          .get();
      for (final doc in descriptioncollectionsSnapshot.docs) {
        final descCourseName = doc.id;
        descriptionCourseList.add(descCourseName);
      }
      update();
      return descriptionCourseList;
    } catch (e) {
      print('Error fetching lectures: $e');
      return ['no Cnnx'];
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
      fetchLectures(selectedCourseId.value, selectedSubCourseId.value);
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