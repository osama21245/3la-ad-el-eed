// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ImagePickerField extends StatefulWidget {
//   final void Function(File imageFile) onImageSelected;

//   const ImagePickerField({super.key, required this.onImageSelected});

//   @override
//   State<ImagePickerField> createState() => _ImagePickerFieldState();
// }

// class _ImagePickerFieldState extends State<ImagePickerField> {
//   File? selectedImage;

//   Future<void> pickImage(ImageSource source) async {
//     final picked = await ImagePicker().pickImage(source: source);
//     if (picked != null) {
//       final imageFile = File(picked.path);
//       setState(() => selectedImage = imageFile);
//       widget.onImageSelected(imageFile);
//     }
//   }

//   void showImageSourceDialog() {
//     showModalBottomSheet(
//       context: context,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//       ),
//       builder:
//           (_) => Padding(
//             padding: const EdgeInsets.all(16),
//             child: Wrap(
//               children: [
//                 ListTile(
//                   leading: Icon(Icons.photo_library),
//                   title: Text("Choose from Gallery"),
//                   onTap: () {
//                     Navigator.pop(context);
//                     pickImage(ImageSource.gallery);
//                   },
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.camera_alt),
//                   title: Text("Take a Photo"),
//                   onTap: () {
//                     Navigator.pop(context);
//                     pickImage(ImageSource.camera);
//                   },
//                 ),
//               ],
//             ),
//           ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final screenWidth = MediaQuery.of(context).size.width;
//         final imageHeight = screenWidth > 600 ? 250.0 : 180.0;
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             GestureDetector(
//               onTap: showImageSourceDialog,
//               child: Container(
//                 height: imageHeight,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey.shade400),
//                   borderRadius: BorderRadius.circular(12),
//                   color: Colors.grey.shade100,
//                   image:
//                       selectedImage != null
//                           ? DecorationImage(
//                             image: FileImage(selectedImage!),
//                             fit: BoxFit.fill,
//                           )
//                           : null,
//                 ),
//                 child:
//                     selectedImage == null
//                         ? Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: const [
//                               Icon(Icons.image, size: 40, color: Colors.grey),
//                               SizedBox(height: 8),
//                               Text("Tap to select an image"),
//                             ],
//                           ),
//                         )
//                         : null,
//               ),
//             ),
//             if (selectedImage != null) ...[
//               SizedBox(height: 12),
//               Center(
//                 child: TextButton.icon(
//                   onPressed: showImageSourceDialog,
//                   icon: Icon(Icons.edit, size: 20),
//                   label: Text("Change Image"),
//                 ),
//               ),
//             ],
//           ],
//         );
//       },
//     );
//   }
// }
