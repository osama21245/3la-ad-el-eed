import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.hintText,
    required this.backgroundColor,
    required this.validator,
    required this.controller,
    this.maxLines
  });
  String? Function(String?)? validator;
  TextEditingController? controller;
  Color backgroundColor;
  String hintText;
  int? maxLines = 1;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
controller: controller,
      validator: validator,
      decoration: InputDecoration(
        fillColor: backgroundColor,
        filled: true,
        hint: Text(hintText),
        hintStyle: TextStyle(
          fontFamily: 'PlusJakartaSans',
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Color(0xff876363),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor,),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
