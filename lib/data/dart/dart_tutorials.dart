import 'package:codekameleon/model/tutorial_model.dart';

import 'tutorials/classes_objects.dart';
import 'tutorials/constructor.dart';
import 'tutorials/for_loop.dart';
import 'tutorials/function.dart';
import 'tutorials/if_else.dart';
import 'tutorials/if_else_if.dart';
import 'tutorials/try_catch.dart';
import 'tutorials/while_loop.dart';



const List<TutorialModel> dartTutorials = [
  TutorialModel(
    title: "For loop",
    description: "Control Flow in Dart",
    duration: "5 min",
    content: for_loop,
  ),
  TutorialModel(
    title: "While loop",
    description: "Control Flow in Dart",
    duration: "7 min",
    content: while_loop,
  ),
  TutorialModel(
    title: "If Else",
    description: "If-Else Statement in Dart",
    duration: "5 min",
    content: if_else,
  ),
  TutorialModel(
    title: "If Else-If",
    description: "If Else-If Statement in Dart",
    duration: "8 min",
    content: if_else_if,
  ),
  TutorialModel(
    title: "Functions",
    description: "Functions in Dart",
    duration: "10 min",
    content: function,
  ),
  TutorialModel(
    title: "Classes And Objects",
    description: "Object Oriented Programming",
    duration: "15 min",
    content: classes_objects,
  ),
  TutorialModel(
    title: "Constructors",
    description: "Object Oriented Programming",
    duration: "7 min",
    content: constructor,
  ),
  TutorialModel(
    title: "Try-Catch",
    description: "Exception Handling",
    duration: "10 min",
    content: try_catch,
  ),
];
