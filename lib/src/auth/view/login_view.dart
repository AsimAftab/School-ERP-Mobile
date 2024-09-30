import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:school_erp/extension/theme_extension.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_text_field.dart';
import '../vm/login_vm.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginViewModelProvider);
    final vm = ref.watch(loginViewModelProvider.notifier);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // Upper portion with logo and welcome text
          Container(
            width: double.infinity,
            height: 500.h, // Adjust height as needed
            decoration: BoxDecoration(
              color: const Color(0xFF197ADC), // Background color
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/logo.svg', // Replace with your logo asset
                  height: 100.h, // Adjust size as needed
                  color: Colors.white,
                ),
                SizedBox(height: 20.h),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Sign in to continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          // Bottom "sheet-like" design
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(18.0), // Padding for form contents
              decoration: BoxDecoration(
                color: Colors.white, // Bottom sheet-like background
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, -3), // Shadow direction
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Makes the container take minimum height
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40.h),
                  Form(
                    key: vm.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PrimaryTextField(
                          prefixIcon: Icons.email,
                          hintText: "Email Address",
                          hasFocusBorder: true,
                          controller: vm.emailController,
                          autofillHints: const [AutofillHints.email],
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) => vm.validateEmail(value),
                        ),
                        SizedBox(height: 20.h),
                        PrimaryTextField(
                          prefixIcon: Icons.lock_outline_rounded,
                          hintText: "Password",
                          hasFocusBorder: true,
                          controller: vm.passwordController,
                          autofillHints: const [AutofillHints.password],
                          obscureText: !loginState.isPasswordVisible,
                          suffixWidget: IconButton(
                            icon: Icon(
                              loginState.isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off_sharp,
                            ),
                            onPressed: () {
                              vm.togglePasswordVisibility();
                            },
                          ),
                          validator: (value) => vm.validatePassword(value),
                        ),
                        SizedBox(height: 8.h),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, 'forgetPassword');
                              },
                              child: Text(
                                'Forget Password?',
                                style: context.theme.textTheme.bodySmall!.copyWith(
                                  color: const Color(0xFF37AFFA),
                                  fontSize: 14.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        PrimaryButton(
                          onPressed: ()  =>  vm.login(),
                          label: 'Login',
                        ),
                        SizedBox(height: 40.h),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
