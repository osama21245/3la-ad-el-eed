import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      leading: Icon(Icons.search, color: Theme.of(context).hintColor),
      backgroundColor: WidgetStateProperty.all(
        const Color.fromARGB(29, 158, 158, 158),
      ),
      shadowColor: WidgetStateProperty.all(Colors.transparent),
      overlayColor: WidgetStateProperty.all(Colors.white),
      shape: WidgetStateProperty.all(
        BeveledRectangleBorder(borderRadius: BorderRadius.circular(7)),
      ),
      hintText: "Search for items or stores",
    );
  }
}
