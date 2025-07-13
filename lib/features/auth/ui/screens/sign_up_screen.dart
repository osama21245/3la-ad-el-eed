import 'package:_3la_ad_el_eed/features/auth/ui/cubit/auth_cubit.dart';
import 'package:_3la_ad_el_eed/features/auth/ui/cubit/auth_state.dart';
import 'package:_3la_ad_el_eed/features/auth/ui/widgets/custom_text_form_field.dart';
import 'package:_3la_ad_el_eed/features/auth/ui/widgets/general_auth_button.dart';
import 'package:_3la_ad_el_eed/features/auth/ui/widgets/welcom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  TextEditingController firsName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        // Using Manual {backgroundColor} Until Make Application Theming
        backgroundColor: Color(0xFFE4E7EA),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 90),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: TopTitle(title: 'Sign up')),

                  // Using SizedBox For Spaceing Until Create Space Tool
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CustomTextFormField(
                      controller: firsName,
                      lableText: "First name",
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CustomTextFormField(
                      controller: lastName,
                      lableText: "Last name",
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CustomTextFormField(
                      controller: email,
                      lableText: "Email",
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CustomTextFormField(
                      controller: password,
                      lableText: "Password",
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CustomTextFormField(
                      controller: phoneNumber,
                      lableText: "Phone number",
                    ),
                  ),
                  SizedBox(height: 10),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return GeneralAuthButton(
                        email: email,
                        password: password,
                        buttonChild:
                            state is AuthLoadingState
                                ? CircularProgressIndicator(color: Colors.white)
                                : Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        onTap: () {
                          context.read<AuthCubit>().signup(
                            email: email.text,
                            password: password.text,
                            phoneNumber: phoneNumber.text,
                            userName: "$firsName $lastName",
                          );
                          // Using {Normal Navigator} For Navigation Until Create Navigation Tool
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "${firsName.text} Account Has Been Created",
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Alreadt have account?",
                        style: TextStyle(color: Theme.of(context).hintColor),
                      ),
                      TextButton(
                        onPressed: () {
                          // Using {Normal Navigator} For Navigation Until Create Navigation Tool
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Log in",
                          style: TextStyle(color: Theme.of(context).hintColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 35),
                  Text(
                    "By signing up, you agree to our Terms of Service and Privacy Policy.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Theme.of(context).hintColor),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
