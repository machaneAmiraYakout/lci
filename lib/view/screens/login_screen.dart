import 'package:elearning/view/screens/signup_screen.dart';
import 'package:elearning/view/screens/started_screen.dart';
import 'package:elearning/view/widgets/colors.dart';
import 'package:elearning/view/widgets/my_custom_button.dart';
import 'package:elearning/view/widgets/my_custom_text.dart';
import 'package:elearning/view/widgets/my_custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: loginController.formKey,
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
                    text: 'Welcome!',
                    index: 1,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: MyCustomTextWidget(
                    text: 'Sign in to continue',
                    index: 2,
                  ),
                ),
                const SizedBox(
                  height: 120,
                ),
                DefaultTextField(
                  onPressed: () {},
                  hintText: 'Enter your email',
                  prefixIcon: const Icon(
                    Icons.email,
                    color: primaryColor,
                  ),
                  controller: loginController.mailController,
                  type: TextInputType.emailAddress,
                  validatorFn: validateEmail,
                ),
                const SizedBox(
                  height: 25,
                ),
                GetBuilder<LoginController>(
                  init: LoginController(),
                  builder: (loginController) => DefaultTextField(
                    hintText: 'Enter your Password',
                    prefixIcon: const Icon(Icons.lock, color: primaryColor),
                    controller: loginController.passwordController,
                    type: TextInputType.visiblePassword,
                    validatorFn: validatePassword,
                    obscuretext: loginController.obscurePassword,
                    suffix: loginController.obscurePassword ? Icons.visibility_off : Icons.visibility,
                    suffixFunction: () {
                      loginController.togglePasswordVisibility();
                      print('whyyyyyyyyyyyyyyyyyyyyyy');
                    },
                  ),
                ),
                const SizedBox(
                  height: 90,
                ),
                CustomButton(
                  onPressed: () {
                    if (loginController.formKey.currentState!.validate()) {
                      loginController.login();
                    }
                  },
                  text: 'LOGIN',
                  primary: buttonColor,
                  onPrimary: Colors.white,
                  sideColor: buttonColor,
                ),
                GestureDetector(
                  onTap: () {
                    Get.find<LoginController>().resetPassword();
                  },
                  child: Center(
                    child: MyCustomTextWidget(
                      text: 'Forget Password?',
                      index: 3,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: GestureDetector(
                      onTap: () => Get.to(() => SignupScreen()),
                      child: Row(
                        children: [
                          MyCustomTextWidget(
                            text: 'Don’t have an account?',
                            index: 4,
                          ),
                          MyCustomTextWidget(
                            text: 'Sign Up',
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
