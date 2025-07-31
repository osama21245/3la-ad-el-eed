import 'package:flutter/widgets.dart';

class TopTitle extends StatelessWidget {
  const TopTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}
