class AuthState {
  final bool isObscureText;

  AuthState({required this.isObscureText});
}

class AuthLoadingState extends AuthState {
  AuthLoadingState() : super(isObscureText: true);
}

class AuthSuccessState extends AuthState {
  AuthSuccessState() : super(isObscureText: true);
}

class AuthErrorState extends AuthState {
  AuthErrorState({required this.errorMessage}) : super(isObscureText: true);
  final String errorMessage;
}
