import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/login_model.dart';
import '../services/auth_services.dart'; // Ensure you import AuthServices

part 'login_vm.g.dart';

@riverpod
class LoginViewModel extends _$LoginViewModel {
  // Create an instance of AuthServices
  final AuthServices authService = AuthServices();

  @override
  LoginState build() {
    return LoginState();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
      try {
        // Use the email and password from the controllers
        final response = await authService.login(
          emailController.text,
          passwordController.text,
          'teacher', // Assuming the role is teacher
        );

        print("Login successful: ${response.data}");
      } catch (e) {
        print("Login failed: $e");
      }
    } else {
      print("Login failed. One or more fields are invalid.");
    }
  }
}
