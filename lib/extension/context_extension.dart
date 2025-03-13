import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
