import 'package:flutter/material.dart';

import 'colors.dart';
class DefaultTextField extends StatelessWidget {
  final Icon prefixIcon;
  final String hintText;
  final TextEditingController controller ;
  final  GestureTapCallback onPressed ;
  final double borderRadius;
  final TextInputType type;
  IconData? suffix ;
  Function? suffixFunction;
  bool obscuretext  ;
  String? textForEmptyUnValid ;
  DefaultTextField({Key? key,
    required this.prefixIcon,
    required this.hintText,
    required this.controller,
    required this.onPressed,
    required this.type,
    this.borderRadius = 14.0,
    this.suffix,
    this.suffixFunction,
    this.obscuretext=false,
    this.textForEmptyUnValid= 'this element is required',
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      color: textFieldCBackgroundColor,
      child:  TextFormField(
        obscureText: obscuretext,
        keyboardType:type ,
        onTap: onPressed,
        validator: (value) {
          if (value!.isEmpty) {
            return textForEmptyUnValid;
          }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: InputBorder.none,
          prefixIcon: prefixIcon,
          suffixIcon: IconButton(
            onPressed: () {
              suffixFunction!();
            },
            icon: Icon(suffix),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          hintText: hintText,
        ),

      ),
    );
  }
}
