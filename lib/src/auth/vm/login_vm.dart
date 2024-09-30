import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/login_model.dart';


part 'login_vm.g.dart';

@riverpod
class LoginViewModel extends _$LoginViewModel {
  @override
  LoginState build() {
    return LoginState();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

/*  void setPassword(String value) {
    state = state.copyWith(
      passwordError: validatePassword(value),
    );
  }

  void setEmail(String value) {
    state = state.copyWith(
      emailError: validateEmail(value),
    );
  }*/

  String? validateEmail(String? value) {
    const emailPattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    final regex = RegExp(emailPattern);
    if (value == null || value.isEmpty) {
      return "Please enter your email";
    } else if (!regex.hasMatch(value)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    }
    return null;
  }

  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  Future<void> login() async {
    if (formKey.currentState?.validate() ?? false) {
      // Form is valid; simulate a successful login action here
  /*    state = state.copyWith(
        emailError: null,
        passwordError: null,
        errorMessage: null,
      );*/
      print("Login successful");
    } else {
      // Form is invalid; update state to show errors
     /* state = state.copyWith(
        emailError: validateEmail(emailController.text),
        passwordError: validatePassword(passwordController.text),
        errorMessage: "Please fill in all fields correctly",
      );*/
      print("Login failed. One or more fields are invalid.");
    }
  }
}
