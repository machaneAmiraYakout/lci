import 'package:elearning/view/screens/signup_screen.dart';
import 'package:elearning/view/widgets/colors.dart';
import 'package:elearning/view/widgets/my_custom_button.dart';
import 'package:elearning/view/widgets/my_custom_text.dart';
import 'package:elearning/view/widgets/my_custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controller/login_controller.dart';
class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

   LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // hide keyboard when user taps outside of textfield
          FocusScope.of(context).unfocus();
        },
        child:Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: loginController.formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 25,
                    color: primaryColor,
                  ),
                ),
                MyCustomTextWidget(
                  text: 'Welcome back !',
                  index: 1,
                ),
                const SizedBox(
                  height: 5,
                ),
                MyCustomTextWidget(
                  text: 'Sign in to continue',
                  index: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Image.asset('assets/images/login.png',width: 250,height: 250,),),
                const SizedBox(
                  height: 20,
                ),
                DefaultTextField(
                  hintText: 'Email',
                  prefixIcon: const Icon(
                    Icons.email,
                    color: primaryColor,
                  ),
                  controller: loginController.mailController,
                  type: TextInputType.emailAddress,
                  validatorFn: validateEmail,
                ),
                const SizedBox(
                  height: 5,
                ),
                GetBuilder<LoginController>(
                  init: LoginController(),
                  builder: (loginController) => DefaultTextField(
                    hintText: 'Password',
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
                  height: 7,
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
                  height: 40,
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
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
    ));
  }
}
