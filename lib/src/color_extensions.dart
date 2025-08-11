import 'package:flutter/material.dart';

extension ColorExtensions on Color {
  bool isBlackOrVariant({int threshold = 30}) {
    final red = r;
    final green = g;
    final blue = b;

    final isCloseToBlack =
        red < threshold && green < threshold && blue < threshold;

    return isCloseToBlack;
  }
}
