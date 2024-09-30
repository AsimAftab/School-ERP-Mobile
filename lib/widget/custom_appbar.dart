import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_erp/extension/theme_extension.dart';

import '../const/app_colors.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final double height;

  // Constructor to accept title, subtitle, and height as parameters
  const CustomAppBar({
    super.key,
    required this.title,
    required this.subtitle,
    this.height = 140, // Default height if not provided
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height.h), // Set custom height
      child: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.r),
            bottomRight: Radius.circular(10.r),
          ),
          child: Container(
            color: AppColors.secondaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: context.theme.textTheme.titleSmall!.copyWith(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.titleSmall!.copyWith(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // This is necessary for the PreferredSizeWidget interface
  @override
  Size get preferredSize => Size.fromHeight(height.h);
}
