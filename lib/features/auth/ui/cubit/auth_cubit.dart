import 'package:_3la_ad_el_eed/features/auth/data/repository/auth_repo.dart';
import 'package:_3la_ad_el_eed/features/auth/ui/cubit/auth_state.dart';
import 'package:_3la_ad_el_eed/features/auth/ui/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState(isObscureText: false));
  AuthRepoImpl authRepoImpl = AuthRepoImpl();
  Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoadingState());
      await authRepoImpl.loginWithEmail(email: email, password: password);
      emit(AuthSuccessState());
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

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Signup successful!"),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      emit(AuthErrorState(errorMessage: e.toString()));
      throw "->>> Error When Login: $e";
    }
  }

  Future<void> signup({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoadingState());
      await authRepoImpl.signUpWithEmail(
        email: email,
        password: password,
      );
      emit(AuthSuccessState());
      //Navigat to Verifing email 
      //Navigat to Create Profile to complete data of user

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(" Account Has Been Created"),backgroundColor: Colors.green,));
    } catch (e) {
      emit(AuthErrorState(errorMessage: e.toString()));
      throw "->>> Error When signup: $e";
    }
  }

  void togglePasswordVisibility(bool isObscureText) {
    if (isObscureText) {
      isObscureText = false;
    } else {
      isObscureText = true;
    }
    emit(AuthState(isObscureText: isObscureText));
  }

  validInput(String fieldName, String val, int min, int max) {
    if (val.isEmpty) {
      return "The $fieldName is required";
    }
    if (val.length < min) {
      return "The $fieldName must be at least $min characters";
    }
    if (val.length > max) {
      return "The $fieldName must be at most $max characters";
    }
    return null;
  }
}
