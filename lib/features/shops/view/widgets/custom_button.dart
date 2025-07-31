import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.style,
    required this.onPressed,
    required this.buttonColor,
  });

  final String title;
  final TextStyle style;
  final void Function() onPressed;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () {
        onPressed();
      },
      child: Text(title, style: style),
    );
  }
}