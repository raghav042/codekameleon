import 'package:codekameleon/data/c/tutorials/classes_objects.dart';
import 'package:codekameleon/data/c/tutorials/constructor.dart';
import 'package:codekameleon/data/c/tutorials/for_loop.dart';
import 'package:codekameleon/data/c/tutorials/function.dart';
import 'package:codekameleon/data/c/tutorials/if_else.dart';
import 'package:codekameleon/data/c/tutorials/if_else_if.dart';
import 'package:codekameleon/data/c/tutorials/try_catch.dart';
import 'package:codekameleon/data/c/tutorials/while_loop.dart';
import 'package:codekameleon/model/tutorial_model.dart';

import '../c/tutorials/introduction.dart';


const List<TutorialModel> cTutorials = [
  TutorialModel(
    title: "Introduction to C",
    description: "All about C programming",
    duration: "12 min",
    content: introduction_to_c,
  ),
  TutorialModel(
    title: "For loop",
    description: "Control Flow in C",
    duration: "5 min",
    content: for_loop,
  ),
  TutorialModel(
    title: "While loop",
    description: "Control Flow in C",
    duration: "7 min",
    content: while_loop,
  ),
  TutorialModel(
    title: "If Else",
    description: "If-Else Statement in C",
    duration: "5 min",
    content: if_else,
  ),
  TutorialModel(
    title: "If Else-If",
    description: "If Else-If Statement in C",
    duration: "8 min",
    content: if_else_if,
  ),
  TutorialModel(
    title: "Functions",
    description: "Functions in C",
    duration: "10 min",
    content: function,
  ),
  TutorialModel(
    title: "Classes And Objects",
    description: "Object Oriented Programming in C",
    duration: "15 min",
    content: classes_objects,
  ),
  TutorialModel(
    title: "Constructors",
    description: "Object Oriented Programming in C",
    duration: "7 min",
    content: constructor,
  ),
  TutorialModel(
    title: "Try-Catch",
    description: "Exception Handling in C",
    duration: "10 min",
    content: try_catch,
  ),
];

