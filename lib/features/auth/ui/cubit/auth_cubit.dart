import 'package:_3la_ad_el_eed/features/auth/data/repository/auth_repo.dart';
import 'package:_3la_ad_el_eed/features/auth/ui/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());
  AuthRepoImpl authRepoImpl = AuthRepoImpl();
  Future<void> login({required String email, required String password}) async {
    try {
      emit(AuthLoadingState());
      await authRepoImpl.loginWithEmail(
        email: email,
        password: password,
      );
      emit(AuthSuccessState());
    } catch (e) {
      throw "->>> Error When Login: $e";
    }
  }
    Future<void> signup({required String email, required String password,required String userName,
    required String phoneNumber,}) async {
    try {
      emit(AuthLoadingState());
      await authRepoImpl.signUpWithEmail(
        email: email,
        password: password,
        
        userName: userName 
      );
      emit(AuthSuccessState());
    } catch (e) {
      throw "->>> Error When signup: $e";
    }
  }
}
