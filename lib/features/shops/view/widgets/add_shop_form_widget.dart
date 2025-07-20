import 'dart:io';

import 'package:_3la_ad_el_eed/features/shops/data/models/shop.dart';
import 'package:_3la_ad_el_eed/features/shops/view/controllers/add%20shops%20cubit/add_shop_cubit.dart';
import 'package:_3la_ad_el_eed/features/shops/view/controllers/add%20shops%20cubit/add_shop_state.dart';
import 'package:_3la_ad_el_eed/features/shops/view/screens/show_shops.dart';

import 'package:_3la_ad_el_eed/features/shops/view/widgets/add_shop_select_category_drop_down_menu.dart';
import 'package:_3la_ad_el_eed/features/shops/view/widgets/pick_image_widget.dart';
import 'package:_3la_ad_el_eed/features/user/view/screens/reviewing_result_screen.dart';
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
  File? shopImage;
  File? nationalIDImage;
  File? commercialRegistrationCertificateImage;
  File? taxIdentificationCertificateImage;
  File? bankAccountDetailsImage;
  File? businessLicenseImage;
  String? selectedCategory;
  final GlobalKey<FormState> formKey = GlobalKey();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final websiteController = TextEditingController();
  final descriptionController = TextEditingController();
  final categoryController = TextEditingController();
  final shopPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddShopCubit, AddShopState>(
      listener: (context, state) {
        if (state.status == AddShopStatus.success) {

          Navigator.push(
            context,

            MaterialPageRoute(builder: (context) => ReviewingResultScreen()),
          );
        } else if (state.status == AddShopStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorMessage ?? 'Unexpected error,please try again',
              ),
            ),
          );
        }
      },
      child: BlocBuilder<AddShopCubit,AddShopState>(
        builder: (context,state){
          if (state.status ==AddShopStatus.loading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else {
           return Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: 24),
                  PickImageWidget(
                    title: 'National ID',
                    onImagePicked: (file) {
                      nationalIDImage = file;
                    },
                  ),
                  SizedBox(height: 24),
                  PickImageWidget(
                    title: 'Commercial Registration Certificate',
                    onImagePicked: (file) {
                      commercialRegistrationCertificateImage = file;
                    },
                  ),
                  SizedBox(height: 24),
                  PickImageWidget(
                    title: 'Tax Identification Certificate',
                    onImagePicked: (file) {
                      taxIdentificationCertificateImage = file;
                    },
                  ),
                  SizedBox(height: 24),
                  PickImageWidget(
                    title: 'Business License',
                    onImagePicked: (file) {
                      businessLicenseImage = file;
                    },
                  ),
                  SizedBox(height: 24),
                  PickImageWidget(
                    title: 'Bank Account Details',
                    onImagePicked: (file) {
                      bankAccountDetailsImage = file;
                    },
                  ),
                  SizedBox(height: 24),
                  PickImageWidget(
                    title: 'Shop logo or image',
                    onImagePicked: (file) {
                      shopImage = file;
                    },
                  ),
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
                  CustomTextFormField(
                    controller: shopPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    hintText: "Shop  password",
                    backgroundColor: Color(0xffF5F2F2),
                  ),
                  SizedBox(height: 24),
                  AddShopSelectCategoryDropDownMenu(
                    onCategoryPicked: (category) {
                      selectedCategory = category;
                    },
                  ),
                  SizedBox(height: 24),
                  CustomButton(
                    onPressed: () {
                      if (formKey.currentState!.validate() && shopImage != null &&
                          nationalIDImage != null &&
                          commercialRegistrationCertificateImage != null &&
                          taxIdentificationCertificateImage != null &&
                          bankAccountDetailsImage != null &&
                          businessLicenseImage != null) {
                        setState(() {
                          final shop = Shop(
                            adminRejectionReasonMessage: '',
                          requestStatus: 0,
                            id: '',
                            name: nameController.text,
                            address: addressController.text,
                            phone: phoneController.text,
                            email: '',
                            website: websiteController.text,
                            description: descriptionController.text,
                            category: selectedCategory!,
                            shopImage: '',
                            nationalIDImage: '',
                            commercialRegistrationCertificateImage: '',
                            taxIdentificationCertificateImage: '',
                            businessLicenseImage: '',
                            bankAccountDetailsImage: '',
                            shopPassword: shopPasswordController.text,
                          );
                          BlocProvider.of<AddShopCubit>(context).addShopWithImages(
                            shop: shop,
                            shopImage: shopImage!,
                            nationalIDImage: nationalIDImage!,
                            commercialRegistrationCertificateImage:
                            commercialRegistrationCertificateImage!,
                            taxIdentificationCertificateImage:
                            taxIdentificationCertificateImage!,
                            businessLicenseImage: businessLicenseImage!,
                            bankAccountDetailsImage: bankAccountDetailsImage!,
                          );
                        }
                        );
                      }
                      else {
                        setState(() {
                          List<String> missingImages = [];
                          if (shopImage == null) missingImages.add("Shop Image");
                          if (nationalIDImage == null) missingImages.add("National ID");
                          if (commercialRegistrationCertificateImage == null) missingImages.add("Commercial Reg. Certificate");
                          if (taxIdentificationCertificateImage == null) missingImages.add("Tax ID Certificate");
                          if (bankAccountDetailsImage == null) missingImages.add("Bank Account Details");
                          if (businessLicenseImage == null) missingImages.add("Business License");

                          if (formKey.currentState!.validate() && missingImages.isEmpty) {
                            // proceed
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  missingImages.isEmpty
                                      ? 'Please fill all required fields.'
                                      : 'Missing: ${missingImages.join(', ')}',
                                ),
                              ),
                            );
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
                  SizedBox(height: 24),
                ],
              ),
            );
          }
        },

      ),
    );
  }
}
