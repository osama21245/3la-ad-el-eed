import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerField extends StatefulWidget {
  final void Function(File imageFile) onImageSelected;

  const ImagePickerField({super.key, required this.onImageSelected});

  @override
  State<ImagePickerField> createState() => _ImagePickerFieldState();
}

class _ImagePickerFieldState extends State<ImagePickerField> {
  File? selectedImage;

  Future<void> pickImage(ImageSource source) async {
    final picked = await ImagePicker().pickImage(source: source);
    if (picked != null) {
      final imageFile = File(picked.path);
      setState(() => selectedImage = imageFile);
      widget.onImageSelected(imageFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        if (selectedImage != null)
          Image.file(
            selectedImage!,
            height: size.height*0.15,
            width: double.infinity,
            fit: BoxFit.fill,
          )
        else
          Container(
            height: size.height*0.15,
            width: double.infinity,
            color: Colors.grey[200],
            alignment: Alignment.center,
            child: Text("No image selected"),
          ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () => pickImage(ImageSource.gallery),
              icon: Icon(Icons.photo_library),
              label: Text("Gallery"),
            ),
            ElevatedButton.icon(
              onPressed: () => pickImage(ImageSource.camera),
              icon: Icon(Icons.camera_alt),
              label: Text("Camera"),
            ),
          ],
        ),
      ],
    );
  }
}
