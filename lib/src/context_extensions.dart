import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  /// Returns true if the current theme is dark mode.
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// Returns the size of the current media (screen).
  Size get size => MediaQuery.of(this).size;

  /// Returns the current color scheme from the theme.
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Returns the current text styles from the theme.
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Returns true if the current text direction is right-to-left.
  bool get isRtl => Directionality.of(this) == TextDirection.rtl;

  /// Returns the current text direction.
  TextDirection get textDirection => Directionality.of(this);

  /// Returns the current theme data.
  ThemeData get theme => Theme.of(this);
}
