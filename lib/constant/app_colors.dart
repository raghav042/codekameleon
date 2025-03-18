import 'package:flutter/material.dart';

class AppColor {
  const AppColor._();

  /// Programming Languages Color
  static const Color dart = Color(0xff1e96fc);
  static const Color cpp = Color(0xff0081CF);
  static const Color c = Color(0xff3f37c9);
  static const Color java = Color(0xffc1121f);
  static const Color javascript = Color(0xfff4b942);
  static const Color kotlin = Color(0xffA97BFF);
  static const Color swift = Color(0xfff3722c);
  static const Color python = Color(0xff0466c8);

  static final lightScheme = ColorScheme.fromSeed(seedColor: Colors.blue);
  static final darkScheme = ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.dark,
  );
}
