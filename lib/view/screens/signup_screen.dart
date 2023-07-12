import 'package:elearning/view/screens/login_screen.dart';
import 'package:elearning/view/screens/verification_screen.dart';
import 'package:elearning/view/widgets/colors.dart';
import 'package:elearning/view/widgets/my_custom_button.dart';
import 'package:elearning/view/widgets/my_custom_text.dart';
import 'package:elearning/view/widgets/my_custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controller/signup_controller.dart';
class SignupScreen extends StatelessWidget {
  final SignupController signupController = Get.put(SignupController());
   SignupScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // hide keyboard when user taps outside of textfield
          FocusScope.of(context).unfocus();
        },
        child:Scaffold(
          body: SingleChildScrollView(
           child: Form(
            key: signupController.formKeys,
             child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                 IconButton(
                   onPressed: () => Get.back(),
                   icon: const Icon(
                     Icons.arrow_back,
                     size: 25,
                     color: primaryColor,
                   ),
                 ),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
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
                   ),],)
               ],),
                Stack(children: [
                  Center(
                    child: Image.asset(
                      'assets/images/Mobile.png',
                      width: 300,
                      height: 300,
                    ),
                  ),
                  Positioned(
                    top: 90,
                    left: 160,
                    child:  Image.asset(
                    'assets/images/lg.jpg',
                    width: 50,
                    height: 50,
                  ),),
                ],),
                DefaultTextField(
                  hintText: 'First Name',
                  prefixIcon: const Icon(
                    Icons.person,
                    color: primaryColor,
                  ),
                  controller: signupController.nameController,
                  type: TextInputType.text,
                ),
                const SizedBox(
                  height: 10,
                ),
                DefaultTextField(
                  hintText: 'Last Name',
                  prefixIcon: const Icon(
                    Icons.perm_identity_sharp,
                    color: primaryColor,
                  ),
                  controller: signupController.lastnameController,
                  type: TextInputType.text,
                ),
                const SizedBox(
                  height: 10,
                ),
                DefaultTextField(
                  hintText: 'Phone Number',
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: primaryColor,
                  ),
                  controller: signupController.phoneController,
                  type: TextInputType.phone,
                ),
                const SizedBox(
                  height: 10,
                ),
                DefaultTextField(
                  hintText: 'Email',
                  prefixIcon: const Icon(
                    Icons.email,
                    color: primaryColor,
                  ),
                  controller: signupController.mailController,
                  type: TextInputType.emailAddress,
                  validatorFn: validateEmail,
                ),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<SignupController>(
                  init: SignupController(),
                  builder: (signupController) => DefaultTextField(
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock, color: primaryColor),
                    controller: signupController.passwordController,
                    type: TextInputType.visiblePassword,
                    validatorFn: validatePassword,
                    obscuretext: signupController.obscurePassword,
                    suffix: signupController.obscurePassword ? Icons.visibility_off : Icons.visibility ,
                    suffixFunction: () {
                      signupController.togglePasswordVisibility();

                    },

                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                // DropdownButtonFormField<String>(
                //   value: signupController.role,
                //   items: const [
                //     DropdownMenuItem(
                //       value: 'boss',
                //       child: Text('boss'),
                //     ),
                //     DropdownMenuItem(
                //       value: 'user',
                //       child: Text('user'),
                //     ),
                //     DropdownMenuItem(
                //       value: 'controller',
                //       child: Text('controller'),
                //     ),
                //   ],
                //   onChanged: (value) {
                //     signupController.role = value!;
                //   },
                //   decoration: const InputDecoration(
                //     labelText: 'Role',
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(20)),
                //     ),
                //     prefixIcon: Icon(Icons.people_outlined,color: primaryColor,),
                //   ),
                // ),
                CustomButton(
                  onPressed: () {
                    Get.to(ConfirmationScreen());
                  },
                  text: 'SIGNUP',
                  primary: buttonColor,
                  onPrimary: Colors.white,
                  sideColor: buttonColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                      onTap: () => Get.to(() => LoginScreen()),
                      child: Row(
                        children: [
                          MyCustomTextWidget(
                            text: 'Already have an account?',
                            index: 4,
                          ),
                          const SizedBox(
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
    ));
  }
}
