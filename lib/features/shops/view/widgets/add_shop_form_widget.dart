import 'dart:io';

import 'package:_3la_ad_el_eed/features/shops/data/models/shop.dart';
import 'package:_3la_ad_el_eed/features/shops/view/controllers/add%20shops%20cubit/add_shop_cubit.dart';
import 'package:_3la_ad_el_eed/features/shops/view/controllers/add%20shops%20cubit/add_shop_state.dart';
import 'package:_3la_ad_el_eed/features/shops/view/screens/show_shops.dart';
import 'package:_3la_ad_el_eed/features/shops/view/widgets/add_shop_image_picker_widget.dart';
import 'package:_3la_ad_el_eed/features/shops/view/widgets/add_shop_select_category_drop_down_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_button.dart';
import 'custom_text_form_field.dart';

class AddShopFormWidget extends StatefulWidget {
  AddShopFormWidget({super.key});

  @override
  State<AddShopFormWidget> createState() => _AddShopFormWidgetState();
}

class _AddShopFormWidgetState extends State<AddShopFormWidget> {
  File? pickedImage;
  String? selectedCategory;
  final GlobalKey<FormState> formKey = GlobalKey();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final websiteController = TextEditingController();
  final descriptionController = TextEditingController();
  final categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddShopCubit,AddShopState>(listener:(context,state){
      if(state.status == AddShopStatus.success ){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowShopsScreen()));
      }
      else if(state.status ==AddShopStatus.error){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.errorMessage ?? 'Unexpected error,please try again')),
        );
      }

    },builder: (context,state){
      return Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: 24),
            AddShopImagePickerWidget(onImagePicked: (file){ pickedImage=file;}),
            SizedBox(height: 24),
            CustomTextFormField(
              controller: nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
              hintText: "Shop name",
              backgroundColor: Color(0xffF5F2F2),
            ),
            SizedBox(height: 24),
            CustomTextFormField(
              controller: addressController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
              hintText: "Shop address",
              backgroundColor: Color(0xffF5F2F2),
            ),
            SizedBox(height: 24),
            CustomTextFormField(
              controller: phoneController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
              hintText: "Shop phone number",
              backgroundColor: Color(0xffF5F2F2),
            ),
            SizedBox(height: 24),
            CustomTextFormField(
              controller: websiteController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
              hintText: "shop  website",
              backgroundColor: Color(0xffF5F2F2),
            ),
            SizedBox(height: 24),
            CustomTextFormField(
              controller: descriptionController,
              validator: null,
              hintText: "Shop  description",
              backgroundColor: Color(0xffF5F2F2),
            ),
            SizedBox(height: 24),
            AddShopSelectCategoryDropDownMenu(
              onCategoryPicked: (category){selectedCategory=category;},
            ),
            SizedBox(height: 24),
            CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  setState(() {
                    final shop =Shop(
                      image: '',
                      id: '',
                      name: nameController.text,
                      address: addressController.text,
                      phone: phoneController.text,
                      email: '',
                      website: websiteController.text,
                      description: descriptionController.text,
                      category: selectedCategory!,
                    );
                    if(pickedImage !=null){
                      BlocProvider.of<AddShopCubit>(context).addShopWithImage(pickedImage!, shop);
                    }
                    else{
                      BlocProvider.of<AddShopCubit>(context).addShop(shop);
                    }
                  });
                }
              },
              text: 'Add Shop',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontFamily: 'PlusJakartaSans',
                color: Color(0xff171212),
              ),
              borderRadius: 12,
              backgroundColor: Color(0xffF9BA8C),
            ),
          ],
        ),
      );
    });
  }
}
