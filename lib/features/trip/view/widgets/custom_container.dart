import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  final IconData icon;
  const CustomContainer({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey, spreadRadius: 0.5)],
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue[800]),
        title: Text(
          text,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
