import 'package:flutter/material.dart';
import 'colors.dart';

class DefaultTextField extends StatelessWidget {
  final Icon prefixIcon;
  final String hintText;
  final TextEditingController controller;
  final GestureTapCallback? onPressed;
  final double borderRadius;
  final TextInputType type;
  final String? Function(String? value)? validatorFn;
  final IconData? suffix;
  final void Function()? suffixFunction;
  final bool obscuretext;
  DefaultTextField({
    Key? key,
    required this.prefixIcon,
    required this.hintText,
    required this.controller,
    required this.type,
    this.onPressed,
    this.borderRadius = 14.0,
    this.suffix,
    this.suffixFunction,
    this.obscuretext = false,
    this.validatorFn,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscuretext,
      keyboardType: type,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixFunction,
                icon: Icon(suffix, color: buttonColor),
              )
            : null,
        labelText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: primaryColor,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: primaryColor,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: primaryColor,
            width: 1.0,
          ),
        ),
        errorStyle: const TextStyle(color: primaryColor),
      ),
      onTap: onPressed,
      validator: validatorFn,
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
