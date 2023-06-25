import 'package:elearning/presenter/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controller/profile_controller.dart';
class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());
    final HomeController homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey[200],
              ),
              child: Obx(() {
                if (profileController.isEditing.value) {
                  return TextField(
                    onChanged: (newValue) {
                      profileController.updateUserName(newValue);
                    },
                    decoration: const InputDecoration(
                      labelText: 'name',
                    ),
                  );
                } else {
                  return Text(
                    homeController.name.value,
                    style: const TextStyle(fontSize: 18.0),
                  );
                }
              }),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: profileController.toggleEditing,
              child: Obx(() {
                return Text(profileController.isEditing.value ? 'Save' : 'Edit');
              }),
            ),
          ],
        ),
      ),
    );
  }
}