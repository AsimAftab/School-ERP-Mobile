import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_erp/extension/theme_extension.dart';


class PrimaryButton extends StatelessWidget {
  final Color? bgColor;
  final Color? fontColor;
  final FontWeight fontWeight;
  final VoidCallback onPressed; // This should trigger the button action
  final TextStyle? textStyle;
  final String label;
  final double cornerRadius;
  final double? fontSize;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    this.fontWeight = FontWeight.w600,
    this.textStyle,
    required this.label,
    this.cornerRadius = 16,
    this.bgColor,
    this.fontColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 321.w,
      child: RawMaterialButton(
        fillColor: bgColor ?? context.theme.primaryColor, // Optional custom color
        splashColor: context.theme.primaryColor.withOpacity(.5),
        hoverColor: context.theme.primaryColor.withOpacity(.2),
        focusColor: context.theme.primaryColor.withOpacity(.5),
        highlightElevation: 2,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cornerRadius.r),
          side: BorderSide(color: context.theme.primaryColor, width: 1.w),
        ),
        onPressed: onPressed, // Now this will work
        child: Text(
          label,
          style: textStyle ??
              context.theme.textTheme.titleSmall!.copyWith(
                color: fontColor ?? Colors.white,
                fontSize: fontSize ?? 18.sp,
                fontFamily: 'Poppins',
                fontWeight: fontWeight,
              ),
        ),
      ),
    );
  }
}

