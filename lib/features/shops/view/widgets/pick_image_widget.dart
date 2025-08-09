// import 'dart:io';

// import 'package:_3la_ad_el_eed/features/shops/view/controllers/pick%20image%20cubit/pick_image_cubit.dart';
// import 'package:_3la_ad_el_eed/features/shops/view/controllers/pick%20image%20cubit/pick_image_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class PickImageWidget extends StatelessWidget {
//   const PickImageWidget({
//     super.key,
//     required this.title,
//     required this.onImagePicked,
//   });

//   final String title;
//   final Function(File) onImagePicked;

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => PickImageCubit(),
//       child: BlocListener<PickImageCubit, PickImageState>(
//         listener: (context, state) {
//           if (state is PickImageSuccess) {
//             onImagePicked(state.file);
//           }
//         },
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15.0),
//               child: Align(
//                 alignment: Alignment.topLeft,
//                 child: Text(
//                   title,
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(color: Color(0xffF5F2F2)),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: BlocBuilder<PickImageCubit, PickImageState>(
//                   builder: (context, state) {
//                     if (state is PickImageSuccess) {
//                       return Column(
//                         children: [
//                           IconButton(
//                             onPressed: () {
//                               BlocProvider.of<PickImageCubit>(context).pickImage();
//                             },
//                             icon: Icon(Icons.refresh_outlined),
//                           ),
//                           SizedBox(height: 15),
//                           Image(image: FileImage(state.file)),
//                         ],
//                       );
//                     } else if (state is PickImageLoading) {
//                       return Column(
//                         children: [
//                           SizedBox(height: 15),
//                           CircularProgressIndicator(),
//                         ],
//                       );
//                     } else if (state is PickImageFailure) {
//                       return Column(
//                         children: [
//                           IconButton(
//                             onPressed: () {
//                               BlocProvider.of<PickImageCubit>(context).pickImage();
//                             },
//                             icon: Icon(Icons.upload),
//                           ),
//                           SizedBox(height: 15),
//                           Text(
//                             state.errMessage,
//                             style: TextStyle(color: Colors.red),
//                           ),
//                         ],
//                       );
//                     } else {
//                       return Column(
//                         children: [
//                           IconButton(
//                             onPressed: () {
//                               BlocProvider.of<PickImageCubit>(context).pickImage();
//                             },
//                             icon: Icon(Icons.upload),
//                           ),
//                           SizedBox(height: 15),
//                           Text(
//                             'Click to upload',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(height: 15),
//                           Text(
//                             'SVG, PNG, JPG or GIF (max. 800x400px)',
//                             style: TextStyle(fontWeight: FontWeight.normal),
//                           ),
//                         ],
//                       );
//                     }
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }