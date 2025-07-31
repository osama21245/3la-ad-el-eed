import 'dart:io';
import 'package:_3la_ad_el_eed/features/shops/view/controllers/pick%20image%20cubit/pick_image_cubit.dart';
import 'package:_3la_ad_el_eed/features/shops/view/controllers/pick%20image%20cubit/pick_image_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddShopImagePickerWidget extends StatelessWidget {
  AddShopImagePickerWidget({super.key, required this.onImagePicked});

  final Function(File) onImagePicked;
  File? image;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>PickImageCubit(),
      child: BlocBuilder<PickImageCubit, PickImageState>(
        builder: (context, state) {
          if (state is PickImageLoading) {
            return CircleAvatar(
              backgroundColor: Color(0xffF5F2F2),
              radius: 50,
              child: CircularProgressIndicator(color: Color(0xffF9BA8C)),
            );
          } else if (state is PickImageSuccess) {
            return CircleAvatar(
              backgroundColor: Color(0xffF5F2F2),
              backgroundImage: FileImage(state.file),
              radius: 50,
              child: IconButton(
                onPressed: () {
                  BlocProvider.of<PickImageCubit>(context).pickImage();
                  onImagePicked(state.file);
                },
                icon: const Icon(
                  Icons.camera_alt_rounded,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            );
          } else if (state is PickImageFailure) {
            return Column(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xffF5F2F2),
                  radius: 50,
                  child: IconButton(
                    onPressed: () {
                      BlocProvider.of<PickImageCubit>(context).pickImage();
                    },
                    icon: const Icon(
                      Icons.camera_alt_rounded,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  state.errMessage,
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            );
          } else {
            return CircleAvatar(
              backgroundColor: Color(0xffF5F2F2),
              radius: 50,
              child: IconButton(
                onPressed: () {
                  BlocProvider.of<PickImageCubit>(context).pickImage();
                },
                icon: const Icon(
                  Icons.camera_alt_rounded,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
