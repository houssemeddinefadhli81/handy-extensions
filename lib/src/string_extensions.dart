import 'package:flutter/material.dart';

extension StringExtensions on String? {
  bool isColor() =>
      int.tryParse('FF${(this ?? '').replaceAll('#', '')}', radix: 16) != null;

  Color toColor() =>
      Color(int.parse('FF${(this ?? '').replaceAll('#', '')}', radix: 16));

  bool isDouble() => double.tryParse(this ?? '') != null;

  bool isInteger() => int.tryParse(this ?? '') != null;

  bool isValidPassword() =>
      RegExp('^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])').hasMatch(this ?? '');

  String convertArabicNumbers() {
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

  String addDashToEmptyString() {
    if (this == null) {
      return '-';
    }
    if ((this ?? '').isEmpty) {
      return '-';
    }
    return this ?? '';
  }

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

  String clean() {
    if (this == null ||
        this?.toLowerCase() == 'null' ||
        this == '""' ||
        this == "''" ||
        (this ?? '').isEmpty) {
      return '';
    }
    return this ?? '';
  }

  String get capitalize {
    if ((this ?? '').isEmpty) {
      return '';
    } else if ((this ?? '').length == 1) {
      return (this ?? '').toUpperCase();
    } else {
      return '${this!.substring(0, 1).toUpperCase()}${this!.substring(1).toLowerCase()}';
    }
  }

  int toInteger() => (double.tryParse(this ?? '') ?? 0.0).toInt();

  double toDouble() => double.tryParse(this ?? '') ?? 0.0;

  String camelCaseToTitleCase() {
    var currentWord = '';
    var capitalizeNext = true;
    final string = (this ?? '').trim();

    for (var i = 0; i < string.length; i++) {
      final char = string[i];

      if (char == '.') {
        capitalizeNext = true;
      } else if (char == ' ' && i > 0 && string[i - 1] == '.') {
        capitalizeNext = true;
      } else if (capitalizeNext && char != ' ') {
        currentWord += char.toUpperCase();
        capitalizeNext = false;
      } else {
        currentWord += char.toLowerCase();
      }
    }

    return currentWord;
  }

  bool isValidEmailAddress() =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this ?? '');

  bool containsUppercase() => RegExp('[A-Z]').hasMatch(this ?? '');

  bool containsLowercase() => RegExp('[a-z]').hasMatch(this ?? '');

  bool containsNumber() => RegExp('[0-9]').hasMatch(this ?? '');

  bool containsSymbol() => RegExp(r'[^\w\s]').hasMatch(this ?? '');

  DateTime? toDateTime() => DateTime.tryParse(this ?? '');
}
