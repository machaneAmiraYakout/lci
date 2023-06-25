import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning/presenter/controller/home_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
class ProfileController extends GetxController{
  var isEditing = false.obs;
  final HomeController homeController = Get.put(HomeController());
  void toggleEditing() {
    isEditing.toggle();
  }
  Future<void> updateUserName(String newName) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final docReference = FirebaseFirestore.instance
          .collection('userInformation')
          .doc(user.uid);
      await docReference.update({'name': newName});
      homeController.name.value = newName;
    }
    update();
  }
}
