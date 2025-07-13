import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class AddShopImagePickerWidget extends StatefulWidget {
   const AddShopImagePickerWidget({super.key,required this.onImagePicked});

   final Function(File) onImagePicked;
  @override
  State<AddShopImagePickerWidget> createState() => _AddShopImagePickerWidgetState();
}

class _AddShopImagePickerWidgetState extends State<AddShopImagePickerWidget> {
  File? image ;
   bool isPicked =false;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Color(0xffF5F2F2),
      backgroundImage:image==null?null: FileImage(image!),
      radius: 50,
      child: IconButton(onPressed: ()async{
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
    setState(() {
    image = File(picked.path);
    });
    widget.onImagePicked(image!);
    isPicked=true;
    }
    },
    icon: const Icon(Icons.camera_alt_rounded, size: 30, color: Colors.black),
    ));
  }
}
