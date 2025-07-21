import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("This button Not Work Yet")));
      },
      child: Text(
        "forgot password",
        style: TextStyle(color:  const Color.fromARGB(215, 255, 86, 34),fontWeight: FontWeight.w700),
      ),
    );
  }
}
