import 'package:flutter/material.dart';

class SnackbarHelper{

  static void snackbarFunction(BuildContext context, String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), duration: const Duration(seconds: 5),));
  }
}