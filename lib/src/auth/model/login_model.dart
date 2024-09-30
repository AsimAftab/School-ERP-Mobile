class LoginState {
  final bool isPasswordVisible;
  final String? errorMessage;
  final String? emailError;
  final String? passwordError;

  LoginState({this.isPasswordVisible = false, this.errorMessage,this.emailError,this.passwordError});

  LoginState copyWith({bool? isPasswordVisible, String? errorMessage,String? emailError,String? passwordError}) {
    return LoginState(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      errorMessage: errorMessage ?? this.errorMessage,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
    );
  }
}


//Method -2
/*class LoginState {
  final bool isPasswordVisible;


  LoginState({
    this.isPasswordVisible = false, // default value for the visibility toggle

  });

  LoginState copyWith({
    bool? isPasswordVisible,
  }) {
    return LoginState(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }
}*/
