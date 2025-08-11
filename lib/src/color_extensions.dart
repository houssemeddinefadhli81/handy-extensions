import 'package:flutter/material.dart';

extension ColorExtensions on Color {
  /// Returns true if the color is close to black within the given threshold.
  bool get isNearBlack {
    final red = r;
    final green = g;
    final blue = b;

    return red < 30 && green < 30 && blue < 30;
  }
}
