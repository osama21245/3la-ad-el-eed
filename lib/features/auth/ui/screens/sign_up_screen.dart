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
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Using Manual {backgroundColor} Until Make Application Theming
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,

        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Back",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
        child: Form(
          key: globalKey,
          child: SingleChildScrollView(
            child: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state.authStates == AuthStates.fail) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                } else if (state.authStates == AuthStates.success) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Created Account Success")),
                  );
                } else {
                  null;
                }
              },
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 30,
                    ),
                    child: TopTitle(title: 'Create a new account'),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10),
                  //   child: CustomTextFormField(
                  //     controller: firsName,
                  //     hintText: "First name",
                  //     validator: (val) {
                  //       return context.read<AuthCubit>().validInput(
                  //         "First name",
                  //         firsName.text,
                  //         2,
                  //         20,
                  //       );
                  //     },
                  //   ),
                  // ),
                  // SizedBox(height: 15),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10),
                  //   child: CustomTextFormField(
                  //     validator: (val) {
                  //       return context.read<AuthCubit>().validInput(
                  //         "Last name",
                  //         lastName.text,
                  //         2,
                  //         20,
                  //       );
                  //     },
                  //     controller: lastName,
                  //     hintText: "Last name",
                  //   ),
                  // ),
                  // SizedBox(height: 15),
                  CustomTextFormField(
                    controller: email,
                    hintText: "Email",

                    validator: (val) {
                      return context.read<AuthCubit>().validInput(
                        "Email",
                        email.text,
                        9,
                        50,
                      );
                    },
                  ),
                  SizedBox(height: 15),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return CustomTextFormField(
                        validator: (val) {
                          return context.read<AuthCubit>().validInput(
                            "Password",
                            password.text,
                            8,
                            50,
                          );
                        },
                        controller: password,
                        hintText: "Password",
                        isObscureText: state.isObscureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            context.read<AuthCubit>().togglePasswordVisibility(
                              state.isObscureText,
                            );
                          },
                          child: Icon(
                            state.isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                            size: 23,
                          ),
                        ),
                      );
                    },
                  ),

                  // SizedBox(height: 15),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10),
                  //   child: CustomTextFormField(
                  //     controller: phoneNumber,
                  //     hintText: "Phone number",
                  //     validator: (val) {
                  //       return context.read<AuthCubit>().validInput(
                  //         "Phone number",
                  //         phoneNumber.text,
                  //         11,
                  //         15,
                  //       );
                  //     },
                  //   ),
                  // ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.3),

                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return GeneralAuthButton(
                        buttonColor:
                            email.text.isNotEmpty && password.text.isNotEmpty
                                ? Color(0xFF194661)
                                : Colors.grey.shade300,
                        email: email,
                        password: password,
                        buttonChild:
                            state.authStates == AuthStates.loading
                                ? CircularProgressIndicator(color: Colors.white)
                                : Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        onTap:
                            email.text.isNotEmpty && password.text.isNotEmpty
                                ? () async {
                                  if (globalKey.currentState!.validate()) {
                                    await context.read<AuthCubit>().signup(
                                      context: context,
                                      email: email.text,
                                      password: password.text,
                                    );
                                  }
                                  // Using {Normal Navigator} For Navigation Until Create Navigation Tool
                                }
                                : () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "Please Enter Your Email And Password",
                                      ),
                                    ),
                                  );
                                },
                      );
                    },
                  ),

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
                  SizedBox(height: 5),
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
