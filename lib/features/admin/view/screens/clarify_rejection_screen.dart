import 'package:_3la_ad_el_eed/features/shops/view/widgets/custom_button.dart';
import 'package:_3la_ad_el_eed/features/shops/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/shop.dart';
import '../controllers/change request status cubit/change_request_status_cubit.dart';
import '../controllers/get shop by Id/get_shop_by_id_cubit.dart';

class ClarifyRejectionScreen extends StatelessWidget {
   ClarifyRejectionScreen({super.key,required this.shop});
   final Shop shop;
final  clarifyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Clarify Rejection',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: "PlusJakartaSans",
            color: Color(0xff171212),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close_rounded, size: 28),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 12),
              child: CustomTextFormField(
                maxLines: 4,
                hintText: 'clarify your rejection',
                backgroundColor: Color(0xffF5F2F2),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
                controller: clarifyController,
              ),
            ),
          CustomButton(onPressed: (){
            BlocProvider.of<ChangeRequestStatusCubit>(context).rejectRequestStatus(shop, clarifyController.text);
            BlocProvider.of<GetShopByIDCubit>(context).getShopByID(shop.id!);
            Navigator.pop(context);
          }, text: 'Send Rejection Message', style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: 'PlusJakartaSans',
            color: Color(0xff171212),
          ), borderRadius: 12, backgroundColor: Color(0xffEF8262))
          ],
        ),
      ),
    );
  }
}
