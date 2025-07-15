
import 'package:flutter/material.dart';

class HomeTitleText extends StatelessWidget {
  const HomeTitleText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(
        context,
      ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600),
    );
  }
}
