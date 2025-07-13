import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
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
