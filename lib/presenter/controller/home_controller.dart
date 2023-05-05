import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
class HomeController extends GetxController {
  final name = ''.obs;
  @override
  void onInit() {
    super.onInit();
    loadUserName();
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
}
