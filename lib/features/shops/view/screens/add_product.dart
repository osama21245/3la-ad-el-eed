// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../core/di/dependency_injection.dart';
// import '../../../../core/theme/app_palette.dart';
// import '../controllers/add_product_cubit.dart';
// import '../controllers/add_product_state.dart';
// import '../widgets/custom_button.dart';
// import '../widgets/custom_text_form_filed.dart';
// import '../widgets/image_picker_filed.dart';

// class AddProduct extends StatefulWidget {
//   const AddProduct({super.key});

//   @override
//   State<AddProduct> createState() => _AddProductState();
// }

// final TextEditingController nameController = TextEditingController();
// final TextEditingController descriptionController = TextEditingController();
// final TextEditingController priceController = TextEditingController();
// final formKey = GlobalKey<FormState>();
// File? selectedImage;

// class _AddProductState extends State<AddProduct> {
//   @override
//   void dispose() {
//     nameController.dispose();
//     descriptionController.dispose();
//     priceController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.sizeOf(context);

//     return Scaffold(
//       appBar: AppBar(title: const Text("Add product"), centerTitle: true),
//       body: BlocProvider(
//         create: (context) => sl<AddProductCubit>(),
//         child: BlocConsumer<AddProductCubit, AddProductState>(
//           listener: (context, state) {
//             if (state.isSuccess) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text("Product added successfully")),
//               );
//               nameController.clear();
//               descriptionController.clear();
//               priceController.clear();
//               setState(() => selectedImage = null);
//             } else if (state.isError) {
//               ScaffoldMessenger.of(
//                 context,
//               ).showSnackBar(SnackBar(content: Text("Failed: ${state.error}")));
//             }
//           },
//           builder: (context, state) {
//             if (state.isLoading) {
//               return const Center(child: CircularProgressIndicator());
//             }
//             return SingleChildScrollView(
//               padding: const EdgeInsets.all(16),
//               child: Form(
//                 key: formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     ImagePickerField(
//                       onImageSelected: (file) {
//                         selectedImage = file;
//                       },
//                     ),
//                     const SizedBox(height: 16),
//                     CustomTextFormFiled(
//                       hintText: "Enter your item name",
//                       controller: nameController,
//                       validator: (text) {
//                         if (text == null || text.trim().isEmpty) {
//                           return "Please enter item name";
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 12),
//                     CustomTextFormFiled(
//                       hintText: "Enter your item description",
//                       controller: descriptionController,
//                       validator: (text) {
//                         if (text == null || text.trim().isEmpty) {
//                           return "Please enter item description";
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 12),
//                     CustomTextFormFiled(
//                       hintText: "Enter your item price",
//                       controller: priceController,
//                       validator: (text) {
//                         if (text == null || text.trim().isEmpty) {
//                           return "Please enter item price";
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: size.height * 0.1),
//                     CustomButton(
//                       text: "Add your product",
//                       onPressed: () {
//                         if (formKey.currentState!.validate()) {
//                           if (selectedImage == null) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text("Please select an image"),
//                               ),
//                             );
//                             return;
//                           }

//                           sl<AddProductCubit>().addProduct(
//                             name: nameController.text.trim(),
//                             description: descriptionController.text.trim(),
//                             price: priceController.text.trim(),
//                             imageBase64: selectedImage!,
//                             shopId: 'n2W0vTrpDYdc70rpyTWq',
//                             userId: '4iUxe2xwauPYSe7KcRzM19ylaF32',
//                           );
//                         }
//                       },
//                       backgroundColor: AppPalette.mainColor,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         color: Color(0xff171212),
//                         fontWeight: FontWeight.w700,
//                       ), borderRadius: 10, 
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
