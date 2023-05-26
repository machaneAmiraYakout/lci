import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
class CourseController extends GetxController {
  var courseList = <String>[].obs;
  var selectedCourseId = ''.obs;
  var selectedCourseName = ''.obs;
  var subCourseList = <String>[].obs;
  var selectedSubCourseId = ''.obs;
  @override
  void onInit() {
    super.onInit();
    fetchCourses();
    fetchSubCourses();
  }
  Future<void> fetchCourses() async {
    try {
      final querySnapshot =
      await FirebaseFirestore.instance.collection('courses').get();
      querySnapshot.docs.forEach((doc) {
        courseList.add(doc.id);
      });

      if (courseList.isNotEmpty) {
        selectedCourseId.value = courseList[0];
        selectedCourseName.value = courseList[0];
        fetchSubCourses();
        print('courses:${courseList}');

      }

      update();
    } catch (e) {
      print('Error fetching courses: $e');
    }
  }
  Future<void> fetchSubCourses() async {
    try {
      subCourseList.clear();

      final courseDocSnapshot = await FirebaseFirestore.instance
          .collection('courses')
          .doc(selectedCourseId.value)
          .get();

      final courseData = courseDocSnapshot.data() as Map<String, dynamic>;

      final subcollectionNames = courseData.keys.toList();

      for (final subcollectionName in subcollectionNames) {
        final subcollectionSnapshot = await FirebaseFirestore.instance
            .collection('courses')
            .doc(selectedCourseId.value)
            .collection(subcollectionName)
            .get();

        final subcollectionDocs = subcollectionSnapshot.docs;

        for (final doc in subcollectionDocs) {
          final subCourseName = doc.id;

          subCourseList.add(subCourseName);
        }
      }

      if (subCourseList.isNotEmpty) {
        selectedSubCourseId.value = subCourseList[0];
      }

      update();
    } catch (e) {
      print('Error fetching subcourses: $e');
    }
  }
  void onCourseSelected(String? courseId) {
    if (courseId != null) {
      selectedCourseId.value = courseId;
      selectedCourseName.value = courseId;
      fetchSubCourses();
    }
  }
  void onSubCourseSelected(String? subCourseId) {
    if (subCourseId != null) {
      selectedSubCourseId.value = subCourseId;
      print('subcourses taped');
    }
  }
}





