import 'package:codekameleon/model/tutorial_model.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

class TutorialInfo {
  const TutorialInfo({
    required this.iconPath,
    required this.syntax,
    required this.tutorials,
  });
  final String iconPath;
  final Syntax syntax;
  final List<TutorialModel> tutorials;
}
