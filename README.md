# stunning_extensions

A lightweight Dart package providing a collection of stunning extension methods for **String**, **BuildContext**, and **Color** types.  
These extensions help make your Flutter and Dart code cleaner, shorter, and more readable.  
This package will grow over time as more utilities are added.

---

## Features

### String Extensions
- Check if a string is a valid color, integer, double, email, or password.
- Convert Arabic numerals to Western digits.
- Normalize strings to title case.
- Capitalize strings properly.
- Convert camelCase strings to Title Case.
- Convert strings to integer or double safely.
- Add dashes for empty strings.
- Clean unwanted or null-like strings.
- Extract DateTime from strings.
- Check for uppercase, lowercase, numbers, and symbols.

### BuildContext Extensions
- Detect if current theme is dark mode.
- Access context size, color scheme, text styles, and theme data.
- Determine text direction and RTL support.

### Color Extensions
- Determine if a color is close to black or a black variant with configurable threshold.

---

## Installation

Add this package to your `pubspec.yaml`:


```yaml
dependencies:
  stunning_extensions: ^1.0.2