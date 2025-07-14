import 'package:flutter/material.dart';

class AddShopSelectCategoryDropDownMenu extends StatelessWidget {
  AddShopSelectCategoryDropDownMenu({super.key,required this.onCategoryPicked});

  final List<String> categories = ['Sport', 'Grocery', 'Restaurants'];
String? newValue;
  final Function(String) onCategoryPicked;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(

      decoration:InputDecoration(

        fillColor: Color(0xffF5F2F2),
        filled: true,
        hint: Text('Select Shop Category'),
        hintStyle: TextStyle(
          fontFamily: 'PlusJakartaSans',
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Color(0xff876363),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffF5F2F2),),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffF5F2F2) ),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffF5F2F2) ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      items:
          categories
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
      value: newValue,
      onChanged: (v) {
        newValue = v;
        onCategoryPicked(v!);
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
    );
  }
}
