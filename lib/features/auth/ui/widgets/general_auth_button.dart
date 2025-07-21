import 'package:flutter/material.dart';

class GeneralAuthButton extends StatelessWidget {
  const GeneralAuthButton({
    super.key,
    required this.email,
    required this.password,
    required this.buttonChild,
    required this.onTap,
    required this.buttonColor,
  });
final Color buttonColor ;
  final TextEditingController email;
  final TextEditingController password;
  final Widget buttonChild;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: buttonChild),
      ),
    );
  }
}
