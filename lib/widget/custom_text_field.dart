import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryTextField extends StatelessWidget {
  final IconData? prefixIcon;
  final Widget? suffixWidget;
  final String hintText;
  final TextEditingController controller;
  final Widget? label;
  final TextStyle? labelStyle;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final List<String>? autofillHints;
  final bool hasFocusBorder;
  final String? errorText;

  const PrimaryTextField({
    super.key,
    this.prefixIcon,
    required this.hintText,
    required this.controller,
    this.suffixWidget,
    this.label,
    this.labelStyle,
    this.validator,
    this.obscureText,
    this.keyboardType,
    this.inputFormatters,
    this.maxLength,
    this.autofillHints,
    this.hasFocusBorder = false,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final hasError = errorText != null && errorText!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
          ),
          obscureText: obscureText ?? false,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          maxLength: maxLength,
          autofillHints: autofillHints,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
            hintText: hintText,
            label: label,
            labelStyle: labelStyle ?? TextStyle(
              color: Colors.grey,
              fontSize: 14.sp,
            ),
            hintStyle: TextStyle(
              color: const Color(0xFFA5A5A5),
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Colors.grey) : null,
            suffixIcon: suffixWidget,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide: BorderSide(color: hasError ? Colors.red : Colors.black),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide: BorderSide(color: hasError ? Colors.red : Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide: BorderSide(color: hasError ? Colors.red : Colors.black, width: 1.w),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide: BorderSide(color: Colors.red, width: 1.w),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide: BorderSide(color: Colors.red, width: 1.w),
            ),
            errorStyle: TextStyle(
              color: Colors.red,
              fontSize: 12.sp,
            ),
            errorMaxLines: 1,
          ),
          validator: validator,
        ),
        if (hasError) // Add space if there's an error message
          SizedBox(height: 8.h),
        if (hasError)
          Text(
            errorText!,
            style: TextStyle(color: Colors.red, fontSize: 12.sp),
          ),
      ],
    );
  }
}
