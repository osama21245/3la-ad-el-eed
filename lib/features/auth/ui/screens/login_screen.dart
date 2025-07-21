import 'package:_3la_ad_el_eed/features/auth/ui/cubit/auth_cubit.dart';
import 'package:_3la_ad_el_eed/features/auth/ui/cubit/auth_state.dart';
import 'package:_3la_ad_el_eed/features/auth/ui/screens/sign_up_screen.dart';
import 'package:_3la_ad_el_eed/features/auth/ui/widgets/custom_text_form_field.dart';
import 'package:_3la_ad_el_eed/features/auth/ui/widgets/forgot_password_button.dart';
import 'package:_3la_ad_el_eed/features/auth/ui/widgets/general_auth_button.dart';
import 'package:_3la_ad_el_eed/features/auth/ui/widgets/welcom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void dispose() {
    super.dispose();

    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 160,
                    child: TopTitle(title: "Log in to your account"),
                  ),
                ),

                // Using SizedBox For Spaceing Until Create Space Tool
                SizedBox(height: 10),
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
                Center(child: ForgotPasswordButton()),
                SizedBox(height: MediaQuery.of(context).size.height * 0.25),
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
                          state is AuthLoadingState
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text(
                                "Log in",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      onTap:
                          email.text.isNotEmpty && password.text.isNotEmpty
                              ? () async {
                                if (formKey.currentState!.validate()) {
                                  await context.read<AuthCubit>().login(
                                    context: context,
                                    email: email.text,
                                    password: password.text,
                                  );

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Login Successful")),
                                  );
                                }
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
                      "Don't have an account?",
                      style: TextStyle(color: Theme.of(context).hintColor),
                    ),
                    TextButton(
                      onPressed: () {
                        // Using {Normal Navigator} For Navigation Until Create Navigation Tool
                        email.text = "";
                        password.text = "";
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign up",

                        style: TextStyle(
                          textBaseline: TextBaseline.ideographic,
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.wavy,
                          decorationColor: Colors.blue,
                          height: 1.5,
                          letterSpacing: 1,

                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
