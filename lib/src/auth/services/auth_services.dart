import 'package:dio/dio.dart';

class AuthServices {
  final Dio _dio = Dio();
  final String baseUrl = 'http://172.16.6.100:3000';

  AuthServices() {
    // Configure Dio options if needed (e.g., timeout)

  }

  Future<Response> login(String email, String password, String role) async {
    final String loginEndpoint = '$baseUrl/auth/login';

    try {
      final response = await _dio.post(
        loginEndpoint,
        data: {
          'email': email,
          'password': password,
          'role': role, // Include role in the payload
        },
      );

      print('Response data: ${response.data}'); // Print response data

      // If the response contains a token or user data, handle it here
      if (response.data['token'] != null) {
        // Save the token securely (e.g., using Flutter Secure Storage)
      }

      return response;
    } on DioError catch (e) {
      // Handle error
      if (e.response != null) {
        print('Error: ${e.response!.data}');
        throw Exception('Login failed: ${e.response!.data['message']}'); // Customize error message
      } else {
        print('Error: ${e.message}');
        throw Exception('Failed to login: ${e.message}');
      }
    }
  }
}
