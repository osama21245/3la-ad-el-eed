enum AuthStates { init, loading, success, fail }

class AuthState {
  final AuthStates authStates;
  final bool isObscureText;
  final String errorMessage;
  AuthState({required this.authStates, required this.isObscureText,required this.errorMessage});
  AuthState copyWith({AuthStates? state, bool? isObscureText,String? errorMessage}) {
    return AuthState(
      authStates: state ?? this.authStates,
      isObscureText: isObscureText ?? this.isObscureText, errorMessage:errorMessage??this.errorMessage,
    );
  }
}
