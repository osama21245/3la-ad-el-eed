import 'package:_3la_ad_el_eed/features/auth/data/repository/auth_repo.dart';
import 'package:_3la_ad_el_eed/features/auth/ui/cubit/auth_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit()
    : super(
        AuthState(
          isObscureText: false,
          authStates: AuthStates.init,
          errorMessage: '',
        ),
      );
  AuthRepoImpl authRepoImpl = AuthRepoImpl();
  Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    if (await authRepoImpl.isInternetConnected()) {
      try {
        emit(state.copyWith(state: AuthStates.loading));
        await authRepoImpl.loginWithEmail(email: email, password: password);
        emit(state.copyWith(state: AuthStates.success));
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
      } catch (e) {
        emit(
          state.copyWith(
            state: AuthStates.fail,
            errorMessage: "Password Or Email was Incorrect",
          ),
        );
        throw "->>> Error When Login: $e";
      }
    } else {
      emit(
        state.copyWith(
          state: AuthStates.fail,
          errorMessage: "Check Your Internet Connection",
        ),
      );
    }
  }

  Future<void> signup({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    if (await authRepoImpl.isInternetConnected()) {
      try {
        emit(state.copyWith(state: AuthStates.loading));
        await authRepoImpl.signUpWithEmail(email: email, password: password);
        emit(state.copyWith(state: AuthStates.success));
        //Navigat to Verifing email
        //Navigat to Create Profile to complete data of user
      } catch (e) {
        emit(
          state.copyWith(
            state: AuthStates.fail,
            errorMessage: "Some Thig went Worg Try Again",
          ),
        );
        throw "->>> Error When signup: $e";
      }
    } else {
      emit(
        state.copyWith(
          state: AuthStates.fail,
          errorMessage: "Check Your Internet Connection",
        ),
      );
    }
  }

  void togglePasswordVisibility(bool isObscureText) {
    if (isObscureText) {
      isObscureText = false;
    } else {
      isObscureText = true;
    }
    emit(state.copyWith(isObscureText: isObscureText));
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
