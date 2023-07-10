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
            ElevatedButton(
              onPressed: () {
                print('Resending email verification...');
                signupController.resendEmailVerification();
              },
              child: const Text('Resend Email'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                bool isVerified = await signupController.checkEmailVerification();
                if (isVerified) {
                  // Handle verified status
                  print('Email is verified');
                  // Continue with sign-up process or navigate to the next screen
                } else {
                  print('Email is not verified');
                  // Handle not verified status
                  // For example: Get.snackbar('Email Not Verified', 'Please verify your email');
                }
              },
              child: const Text('Check Verification Status'),
            ),
          ],
        ),
      ),
    );
  }
}
