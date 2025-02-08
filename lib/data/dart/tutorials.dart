import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import '../../model/tutorial_info.dart';
import '../../model/tutorial_model.dart';

const TutorialInfo dartTutorials = TutorialInfo(
  iconPath: "assets/icons/dart.png",
  syntax: Syntax.DART,
  tutorials: [
    TutorialModel(
      title: "For loop",
      description: "Control Flow in Dart",
      duration: "5 min",
      filePath: "assets/tutorials/dart/for_loop.md",
    ),
    TutorialModel(
      title: "While loop",
      description: "Control Flow in Dart",
      duration: "7 min",
      filePath: "assets/tutorials/dart/while_loop.md",
    ),
    TutorialModel(
      title: "If Else",
      description: "If-Else Statement in Dart",
      duration: "5 min",
      filePath: "assets/tutorials/dart/if_else.md",
    ),
    TutorialModel(
      title: "If Else-If",
      description: "If Else-If Statement in Dart",
      duration: "8 min",
      filePath: "assets/tutorials/dart/if_else_if.md",
    ),
    TutorialModel(
      title: "Functions",
      description: "Functions in Dart",
      duration: "10 min",
      filePath: "assets/tutorials/dart/function.md",
    ),
    TutorialModel(
      title: "Classes And Objects",
      description: "Object Oriented Programming",
      duration: "15 min",
      filePath: "assets/tutorials/dart/classes_objects.md",
    ),
    TutorialModel(
      title: "Constructors",
      description: "Object Oriented Programming",
      duration: "7 min",
      filePath: "assets/tutorials/dart/constructor.md",
    ),
    TutorialModel(
      title: "Try-Catch",
      description: "Exception Handling",
      duration: "10 min",
      filePath: "assets/tutorials/dart/try_catch.md",
    ),
  ],
);
