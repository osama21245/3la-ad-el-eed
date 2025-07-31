import 'package:flutter/material.dart';
import '../../../../core/theme/app_palette.dart';

class CustomTextFormFiled extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isObscure;
  final TextInputType keyBoardType;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final Color color;
  const CustomTextFormFiled({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.isObscure = false,
    this.keyBoardType = TextInputType.text,
    required this.controller,
    required this.validator,
    this.color = AppPalette.lightGrayColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 12),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 23, horizontal: 20),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppPalette.lightGrayColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppPalette.lightGrayColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppPalette.lightGrayColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppPalette.lightGrayColor),
          ),
          hintText: hintText,
          // hintStyle: Styles.style13,
          filled: true,
          fillColor: AppPalette.lightGrayColor,
        ),
        // style: Styles.style13,
        keyboardType: keyBoardType,
        obscureText: isObscure,
        validator: validator,
        controller: controller,
        autofocus: false,
      ),
    );
  }
}
