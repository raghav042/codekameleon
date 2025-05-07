import 'package:codekameleon/data/javascript/tutorials/constructor.dart';
import 'package:codekameleon/data/javascript/tutorials/for_loop.dart';
import 'package:codekameleon/data/javascript/tutorials/function.dart';
import 'package:codekameleon/data/javascript/tutorials/if_else.dart';
import 'package:codekameleon/data/javascript/tutorials/if_else_if.dart';
import 'package:codekameleon/data/javascript/tutorials/try_catch.dart';
import 'package:codekameleon/data/javascript/tutorials/while_loop.dart';
import 'package:codekameleon/data/javascript/tutorials/classes_objects.dart';
import 'package:codekameleon/data/javascript/tutorials/introduction.dart';

import '../../model/tutorial_model.dart';

const List<TutorialModel> jsTutorials = [
  TutorialModel(
    title: "Introduction to JavaScript",
    description: "All about JavaScript",
    duration: "12 min",
    content: introduction_to_javascript,
  ),
  TutorialModel(
    title: "For loop",
    description: "Control Flow in JavaScript",
    duration: "5 min",
    content: for_loop,
  ),
  TutorialModel(
    title: "While loop",
    description: "Control Flow in JavaScript",
    duration: "7 min",
    content: while_loop,
  ),
  TutorialModel(
    title: "If Else",
    description: "If-Else Statement in JavaScript",
    duration: "5 min",
    content: if_else,
  ),
  TutorialModel(
    title: "If Else-If",
    description: "If Else-If Statement in JavaScript",
    duration: "8 min",
    content: if_else_if,
  ),
  TutorialModel(
    title: "Functions",
    description: "Functions in JavaScript",
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
