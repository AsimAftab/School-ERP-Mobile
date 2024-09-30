import 'package:flutter/material.dart';
import '../const/app_colors.dart';
import '../extension/theme_extension.dart';

/// `AppTheme` class manages the app's theme, including light and dark mode switching,
/// setting the font family, and customizing the `TextTheme` and `ThemeData` properties.
class AppTheme {
  /// Boolean that determines if the theme is dark or light.
  bool isDarkTheme;

  /// Context is used to retrieve the current theme or modify the `TextTheme`.
  BuildContext context;

  /// Default constructor for `AppTheme`.
  /// Initializes `isDarkTheme` and requires a `BuildContext` to work with.
  AppTheme({this.isDarkTheme = false, required this.context});

  /// The font family used across the application, set to 'Poppins'.
  String fontFamily = 'Poppins';

  /// Returns the app's current theme data by calling `getAppTheme()`.
  ThemeData get getTheme => getAppTheme();

  /// Method that defines and returns the `ThemeData` for the app, which includes:
  /// - Primary color from `AppColors`
  /// - Custom text styles using the `TextTheme`
  /// - Option to use theme extensions
  ThemeData getAppTheme() {
    return ThemeData(
      // Sets the primary color for the theme from a predefined color in `AppColors`.
      primaryColor: AppColors.primaryColor,

      // Sets the default font family to 'Poppins'.
      fontFamily: fontFamily,

      // Focus color for interactive elements like text fields and buttons.
      focusColor: AppColors.primaryColor,

      // Add custom theme extensions, for now it is empty but can be populated later.
      extensions: const <ThemeExtension<AppColorExtension>>[],

      // Defines the text theme, copying the default and customizing specific styles.
      textTheme: Theme.of(context).textTheme.copyWith(
        // `displaySmall`, `displayMedium`, and `displayLarge` are used for large titles or headings.
        // They share the same customization: font size 18, font weight 500, and primary color.
        displaySmall: Theme.of(context).textTheme.titleSmall?.copyWith(
          fontSize: 18,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryColor,
        ),
        displayMedium: Theme.of(context).textTheme.titleSmall?.copyWith(
          fontSize: 18,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryColor,
        ),
        displayLarge: Theme.of(context).textTheme.titleSmall?.copyWith(
          fontSize: 18,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryColor,
        ),

        // `titleLarge` is used for larger text (like section titles), with a font size of 30.
        titleLarge: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontSize: 30,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryColor,
        ),

        // `titleMedium` and `titleSmall` for mid-sized and small headings, font size 18, font weight 500.
        titleMedium: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontSize: 18,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryColor,
        ),
        titleSmall: Theme.of(context).textTheme.titleSmall?.copyWith(
          fontSize: 18,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryColor,
        ),

        // Body text uses `bodyLarge`, `bodyMedium`, and `bodySmall`, customized similarly.
        bodyLarge: Theme.of(context).textTheme.titleSmall?.copyWith(
          fontSize: 18,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryColor,
        ),
        bodyMedium: Theme.of(context).textTheme.titleSmall?.copyWith(
          fontSize: 18,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryColor,
        ),
        bodySmall: Theme.of(context).textTheme.titleSmall?.copyWith(
          fontSize: 18,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryColor,
        ),

        // Labels use `labelLarge`, `labelMedium`, and `labelSmall` with the same styles.
        labelLarge: Theme.of(context).textTheme.titleSmall?.copyWith(
          fontSize: 18,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryColor,
        ),
        labelMedium: Theme.of(context).textTheme.titleSmall?.copyWith(
          fontSize: 18,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryColor,
        ),
        labelSmall: Theme.of(context).textTheme.titleSmall?.copyWith(
          fontSize: 18,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
