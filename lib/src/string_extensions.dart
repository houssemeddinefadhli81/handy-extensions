import 'package:flutter/material.dart';

extension StringExtensions on String? {
  /// Checks if the string represents a valid color hex code.
  bool get isHexColor =>
      int.tryParse('FF${(this ?? '').replaceAll('#', '')}', radix: 16) != null;

  /// Converts the string to a [Color], assuming it's a valid hex color.
  Color toColor() =>
      Color(int.parse('FF${(this ?? '').replaceAll('#', '')}', radix: 16));

  /// Checks if the string can be parsed as a double.
  bool get isDouble => double.tryParse(this ?? '') != null;

  /// Checks if the string can be parsed as an integer.
  bool get isInteger => int.tryParse(this ?? '') != null;

  /// Checks if the string matches a password pattern (at least one uppercase, lowercase, and digit).
  bool get isValidPassword =>
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])').hasMatch(this ?? '');

  /// Converts Arabic numerals in the string to Western digits.
  String convertArabicToWesternDigits() {
    final arabicToWestern = {
      '٠': '0',
      '١': '1',
      '٢': '2',
      '٣': '3',
      '٤': '4',
      '٥': '5',
      '٦': '6',
      '٧': '7',
      '٨': '8',
      '٩': '9',
    };

    return (this ?? '')
        .split('')
        .map((char) => arabicToWestern[char] ?? char)
        .join();
  }

  /// Returns '-' if the string is null or empty, otherwise returns the string.
  String get dashIfEmpty {
    if (this == null || (this ?? '').isEmpty) {
      return '-';
    }
    return this ?? '';
  }

  /// Normalizes the string to title case, splitting camelCase and removing non-alphanumeric chars.
  String normalizeToTitleCase() {
    var cleaned = (this ?? '').trim().replaceAll(RegExp(r'[^a-zA-Z0-9]'), ' ');

    cleaned = cleaned.replaceAllMapped(
      RegExp(r'([a-z])([A-Z])'),
      (match) => '${match.group(1)} ${match.group(2)}',
    );

    final words = cleaned
        .split(' ')
        .where((word) => word.trim().isNotEmpty)
        .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
        .toList();

    return words.join(' ');
  }

  /// Cleans the string by returning empty if it is null, 'null', or empty quotes.
  String get cleaned {
    if (this == null ||
        this?.toLowerCase() == 'null' ||
        this == '""' ||
        this == "''" ||
        (this ?? '').isEmpty) {
      return '';
    }
    return this ?? '';
  }

  /// Capitalizes the first letter and lowercases the rest of the string.
  String get capitalized {
    if ((this ?? '').isEmpty) {
      return '';
    } else if ((this ?? '').length == 1) {
      return (this ?? '').toUpperCase();
    } else {
      return '${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}';
    }
  }

  /// Converts the string to an integer, parsing as double first if necessary.
  int toInt() => (double.tryParse(this ?? '') ?? 0.0).toInt();

  /// Converts the string to a double.
  double toDouble() => double.tryParse(this ?? '') ?? 0.0;

  /// Converts a camelCase string to Title Case.
  String camelCaseToTitleCase() {
    var result = '';
    var capitalizeNext = true;
    final string = (this ?? '').trim();

    for (var i = 0; i < string.length; i++) {
      final char = string[i];

      if (char == '.') {
        capitalizeNext = true;
      } else if (char == ' ' && i > 0 && string[i - 1] == '.') {
        capitalizeNext = true;
      } else if (capitalizeNext && char != ' ') {
        result += char.toUpperCase();
        capitalizeNext = false;
      } else {
        result += char.toLowerCase();
      }
    }

    return result;
  }

  /// Checks if the string is a valid email address.
  bool get isValidEmail =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this ?? '');

  /// Checks if the string contains at least one uppercase letter.
  bool get hasUppercase => RegExp(r'[A-Z]').hasMatch(this ?? '');

  /// Checks if the string contains at least one lowercase letter.
  bool get hasLowercase => RegExp(r'[a-z]').hasMatch(this ?? '');

  /// Checks if the string contains at least one number.
  bool get hasNumber => RegExp(r'[0-9]').hasMatch(this ?? '');

  /// Checks if the string contains at least one symbol (non-alphanumeric).
  bool get hasSymbol => RegExp(r'[^\w\s]').hasMatch(this ?? '');

  /// Parses the string to a DateTime, returns null if invalid.
  DateTime? toDateTime() => DateTime.tryParse(this ?? '');
}
