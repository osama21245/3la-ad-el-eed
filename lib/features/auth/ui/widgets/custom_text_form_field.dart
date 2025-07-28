import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  const CustomTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: const Color.fromARGB(215, 255, 86, 34),
      validator: validator,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Color(0xFFE25839)),

        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(215, 255, 86, 34),
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: const Color.fromARGB(103, 158, 158, 158),
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        hintStyle:
            hintStyle ??
            TextStyle(
              color: Theme.of(context).hintColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      obscuringCharacter: "*",
      obscureText: isObscureText ?? false,
      style: TextStyle(
        color: Theme.of(context).hintColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
