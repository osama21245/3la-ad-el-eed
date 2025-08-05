import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
 add_product
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

  CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.style,
    required this.borderRadius,
    required this.backgroundColor,
  });
  void Function()? onPressed;
  String text;
  TextStyle? style;
  double borderRadius;
  Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          overlayColor: Color(0xffF5F2F2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: 20,vertical:15 ),
        ),
        onPressed: onPressed,
        child: Text(text, style: style),
      ),
    );
  }
}
 development
