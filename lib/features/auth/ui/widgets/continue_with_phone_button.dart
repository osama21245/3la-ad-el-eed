import 'package:flutter/material.dart';

class ContinueWithPhoneButton extends StatelessWidget {
  const ContinueWithPhoneButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("This button Not Working Yet")));
      },
      child: Container(
        height: 40,
        width:
            MediaQuery.of(context).size.width -
            MediaQuery.of(context).size.width * 0.54,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            "Continue with phone",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
