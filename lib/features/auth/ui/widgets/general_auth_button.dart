import 'package:flutter/material.dart';

class GeneralAuthButton extends StatelessWidget {
  const GeneralAuthButton({
    super.key,
    required this.email,
    required this.password,
    required this.buttonChild,
    required this.onTap,
  });

  final TextEditingController email;
  final TextEditingController password;
  final Widget buttonChild;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        height: 46,
        decoration: BoxDecoration(
          color: const Color.fromARGB(215, 255, 86, 34),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(child: buttonChild),
      ),
    );
  }
}
