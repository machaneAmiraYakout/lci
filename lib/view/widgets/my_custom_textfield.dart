import 'package:flutter/material.dart';

import 'colors.dart';
class DefaultTextField extends StatelessWidget {
  final Icon prefixIcon;
  final String hintText;
  final TextEditingController controller ;
  final  GestureTapCallback? onPressed ;
  final double borderRadius;
  final TextInputType type;
  final String? Function(String? value)? validatorFn;
  final IconData? suffix ;
  var suffixFunction;
  bool obscuretext  ;
  DefaultTextField({Key? key,
    required this.prefixIcon,
    required this.hintText,
    required this.controller,
    required this.type,
    this.onPressed,
    this.borderRadius = 14.0,
    this.suffix,
    this.suffixFunction,
    this.obscuretext=false,
    this.validatorFn,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        border: Border.all(
        color: primaryColor,
        width: 1.0,),
          borderRadius: BorderRadius.circular(5.0),
        ),
      child:  TextFormField(
        obscureText: obscuretext,
        keyboardType:type ,
        onTap: onPressed,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: prefixIcon,
          suffixIcon: IconButton(
            onPressed: () {
              suffixFunction();
              print('icon pressed');
              },
            icon: Icon(suffix,color: buttonColor,),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          hintText: hintText,
          errorStyle: const TextStyle(color:primaryColor), // Set the color of the error text
        ),
        validator: validatorFn,
      ),
    );
  }
}
String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }
  if (value.length <= 8) {
    return 'Password should contain exactly 8 characters';
  }
  if (!value.contains(new RegExp(r'[A-Z]'))) {
    return 'Password should contain at least one uppercase letter';
  }
  return null;
}
String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  }
  return null;
}