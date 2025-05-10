import 'dart:ui';

import 'package:flutter_syntax_view/flutter_syntax_view.dart';

import 'quiz_model.dart';
import 'tutorial_model.dart';

class LanguageModel {
  const LanguageModel({
    required this.name,
    required this.smallIcon,
    required this.largeIcon,
    required this.syntax,
    required this.color,
    required this.tutorials,
    required this.quizes,
  });

  final String name;
  final String smallIcon;
  final String largeIcon;
  final Syntax syntax;
  final Color color;
  final List<TutorialModel> tutorials;
  final List<QuizModel> quizes;
}
