import 'package:elearning/view/screens/login_screen.dart';
import 'package:elearning/view/screens/started_screen.dart';
import 'package:elearning/view/widgets/colors.dart';
import 'package:elearning/view/widgets/my_custom_button.dart';
import 'package:elearning/view/widgets/my_custom_text.dart';
import 'package:elearning/view/widgets/my_custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controller/signup_controller.dart';
class SignupScreen extends StatelessWidget {
  final SignupController signupController = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: signupController.formKeys,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Get.to(() => const StartScreen()),
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 25,
                    color: primaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: MyCustomTextWidget(
                    text: 'Hi!',
                    index: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: MyCustomTextWidget(
                    text: 'Create a new account',
                    index: 2,
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                DefaultTextField(
                  onPressed: () {},
                  hintText: 'Enter your Name',
                  prefixIcon: const Icon(
                    Icons.person,
                    color: primaryColor,
                  ),
                  controller: signupController.nameController,
                  type: TextInputType.text,
                ),
                const SizedBox(
                  height: 50,
                ),
                DefaultTextField(
                  onPressed: () {
                    print(signupController.mailController.text);
                  },
                  hintText: 'Enter your email',
                  prefixIcon: const Icon(
                    Icons.email,
                    color: primaryColor,
                  ),
                  controller: signupController.mailController,
                  type: TextInputType.emailAddress,
                  validatorFn: validateEmail,
                ),
                const SizedBox(
                  height: 50,
                ),
                GetBuilder<SignupController>(
                  init: SignupController(),
                  builder: (signupController) => DefaultTextField(
                    hintText: 'Enter your Password',
                    prefixIcon: const Icon(Icons.lock, color: primaryColor),
                    controller: signupController.passwordController,
                    type: TextInputType.visiblePassword,
                    validatorFn: validatePassword,
                    obscuretext: signupController.obscurePassword,
                    suffix: signupController.obscurePassword ? Icons.visibility_off : Icons.visibility,
                    suffixFunction: () {
                      signupController.togglePasswordVisibility();
                      print('whyyyyyyyyyyyyyyyyyyyyyy');
                    },
                  ),
                ),
                const SizedBox(
                  height: 90,
                ),
                CustomButton(
                  onPressed: () {
                    if (signupController.formKeys.currentState!.validate()) {
                      signupController.signup();
                    }
                  },
                  text: 'SIGNUP',
                  primary: buttonColor,
                  onPrimary: Colors.white,
                  sideColor: buttonColor,
                ),
                SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: GestureDetector(
                      onTap: () => Get.to(() => LoginScreen()),
                      child: Row(
                        children: [
                          MyCustomTextWidget(
                            text: 'Already have an account?',
                            index: 4,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          MyCustomTextWidget(
                            text: 'Login',
                            index: 5,
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
