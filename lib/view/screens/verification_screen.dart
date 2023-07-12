import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controller/signup_controller.dart';
class ConfirmationScreen extends StatelessWidget {
  final SignupController signupController = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email Confirmation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Please verify your email',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                signupController.signup();
              },
              child: const Text('Check Verification Status'),
            ),
          ],
        ),
      ),
    );
  }
}