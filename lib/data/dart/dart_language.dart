import 'package:flutter_syntax_view/flutter_syntax_view.dart';

import '../../constant/app_colors.dart';
import '../../model/language_model.dart';
import 'dart_quizes.dart';
import 'dart_tutorials.dart';

const LanguageModel dartLanguage = LanguageModel(
  name: "Dart",
  smallIcon: "assets/icons/dart.png",
  largeIcon: "assets/icons/dart_large.png",
  syntax: Syntax.DART,
  color: AppColor.dart,
  tutorials: dartTutorials,
  quizes: dartQuizes,
);
