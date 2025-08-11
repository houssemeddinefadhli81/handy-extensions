import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  Size get getContextSize => MediaQuery.of(this).size;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textStyles => Theme.of(this).textTheme;

  bool get isRtl => Directionality.of(this) == TextDirection.rtl;

  TextDirection get getTextDirection => Directionality.of(this);

  ThemeData get themeData => Theme.of(this);
}
