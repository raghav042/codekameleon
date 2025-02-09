import 'package:codekameleon/model/tutorial_model.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

class CourseModel {
  const CourseModel({
    required this.name,
    required this.smallIcon,
    required this.largeIcon,
    required this.syntax,
    required this.tutorials,
  });
  final String name;
  final String smallIcon;
  final String largeIcon;
  final Syntax syntax;
  final List<TutorialModel> tutorials;
}
