import 'package:_3la_ad_el_eed/features/auth/ui/cubit/auth_cubit.dart';
import 'package:_3la_ad_el_eed/features/auth/ui/cubit/auth_state.dart';
import 'package:_3la_ad_el_eed/features/auth/ui/screens/sign_up_screen.dart';
import 'package:_3la_ad_el_eed/features/auth/ui/widgets/continue_with_email_button.dart';
import 'package:_3la_ad_el_eed/features/auth/ui/widgets/continue_with_phone_button.dart';
import 'package:_3la_ad_el_eed/features/auth/ui/widgets/custom_text_form_field.dart';
import 'package:_3la_ad_el_eed/features/auth/ui/widgets/forgot_password_button.dart';
import 'package:_3la_ad_el_eed/features/auth/ui/widgets/general_auth_button.dart';
import 'package:_3la_ad_el_eed/features/auth/ui/widgets/welcom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: Color(0xFFE4E7EA),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 120),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: TopTitle(title: "Welcome back")),

                  // Using SizedBox For Spaceing Until Create Space Tool
                  SizedBox(height: 10),
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
                  ForgotPasswordButton(),
                  SizedBox(height: 6),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return GeneralAuthButton(
                        email: email,
                        password: password,
                        buttonChild:
                            state is AuthLoadingState
                                ? CircularProgressIndicator(color: Colors.white)
                                : Text(
                                  "Log in",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        onTap: () {
                          context.read<AuthCubit>().login(
                            email: email.text,
                            password: password.text,
                          );

                          // state is AuthSuccessState
                          // // Using {Normal Navigator} For Navigation Until Create Navigation Tool
                          //     ? Navigator.of(context).push(
                          //       MaterialPageRoute(
                          //         builder: (context) => NextFeatre(),
                          //       ),
                          //     )
                          //     : Navigator.of(context).push(
                          //       MaterialPageRoute(
                          //         builder: (context) => AuthFailureHandel(),
                          //       ),
                          //     );
                        },
                      );
                    },
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ContinueWithPhoneButton(),
                      ContinueWithEmailButton(),
                    ],
                  ),
                  SizedBox(height: 180),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Theme.of(context).hintColor),
                      ),
                      TextButton(
                        onPressed: () {
                          // Using {Normal Navigator} For Navigation Until Create Navigation Tool
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(color: Theme.of(context).hintColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
