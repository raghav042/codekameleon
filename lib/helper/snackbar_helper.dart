import 'package:flutter/material.dart';

class SnackBarHelper {
  const SnackBarHelper._();

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
