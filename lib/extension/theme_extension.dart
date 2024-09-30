import 'package:flutter/material.dart';

/// Extension to provide easy access to the current `ThemeData` from a `BuildContext`.
/// Instead of writing `Theme.of(context)` everywhere, you can simply use `context.theme`.
extension ThemeContextExtension on BuildContext {
  /// Returns the current `ThemeData` associated with the `BuildContext`.
  ThemeData get theme => Theme.of(this);
}

/// Extension to provide easy access to the custom `AppColorExtension` from a `BuildContext`.
/// This allows you to access your custom color scheme via `context.appColors`.
extension ColorExtension on BuildContext {
  /// Returns the custom `AppColorExtension` for accessing additional app colors.
  /// Throws an error if `AppColorExtension` is not defined in the app theme.
  AppColorExtension get appColors =>
      Theme.of(this).extension<AppColorExtension>()!;
}

/// Custom class that extends Flutter's `ThemeExtension` to add more colors to the theme.
/// It enables you to define custom colors beyond the default colors provided by `ThemeData`.
class AppColorExtension extends ThemeExtension<AppColorExtension> {
  /// Custom colors defined for the app theme.
  /// These colors are optional and can be extended as needed.
  final Color? color1;
  final Color? color2;
  final Color? color3;

  /// Default constructor for `AppColorExtension`.
  /// Takes three optional color values.
  const AppColorExtension({
    this.color1,
    this.color2,
    this.color3,
  });

  /// Named constructor to initialize the extension with default values for additional colors.
  /// You can expand the number of colors as needed for your app.
  AppColorExtension.withColors({
    Color? color1,
    Color? color2,
    Color? color3,
    Color? color4,  // Additional color, can be defined in the future.
  }) : this(
    color1: color1,
    color2: color2,
    color3: color3,
  );

  /// Copies the current instance of `AppColorExtension` with the option to override specific colors.
  /// This is useful when you want to modify just one or a few color values, leaving others unchanged.
  @override
  AppColorExtension copyWith({
    Color? color1,
    Color? color2,
    Color? color3,
    Color? color4,  // Future additional colors.
    Color? dotColor,
    Color? continueWithText,
    Color? dropDownWidgetBackground,
    Color? dropDownButtonColor,
    Color? borderColor,
    Color? cardColor,
    Color? menuIconColor,
    Color? drawerColor,
    Color? friendCardTextColor,
    Color? dropDownIconColor,
    Color? drawerCardColor,
  }) {
    return AppColorExtension(
      color1: color1 ?? this.color1,
      color2: color2 ?? this.color2,
      color3: color3 ?? this.color3,
    );
  }

  /// Interpolates between two `AppColorExtension` instances based on a given ratio `t`.
  /// This method is commonly used for smooth theme transitions (e.g., dark mode to light mode).
  @override
  AppColorExtension lerp(ThemeExtension<AppColorExtension>? other, double t) {
    if (other is! AppColorExtension) {
      return this;
    }
    return AppColorExtension(
      color1: Color.lerp(color1, other.color1, t),
      color2: Color.lerp(color2, other.color2, t),
      color3: Color.lerp(color3, other.color3, t),
    );
  }
}
