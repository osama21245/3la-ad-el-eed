import 'dart:io';

import 'package:_3la_ad_el_eed/features/shops/view/controllers/pick%20image%20cubit/pick_image_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
class PickImageCubit extends Cubit<PickImageState>{
  PickImageCubit() :super (PickImageInitial());
  pickImage()async{
    emit(PickImageLoading());
   try {
     final picked =await ImagePicker().pickImage(source: ImageSource.gallery);
      if(picked!=null){
         final image = File(picked.path);
         emit(PickImageSuccess(image));}
         else{
           emit(PickImageFailure("image didn't selected"));
      }
   } on Exception catch (e) {
    emit(PickImageFailure('Error ,please try to select image again'));
   }
    }
  }

