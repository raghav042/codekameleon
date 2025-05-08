import 'package:codekameleon/data/c++/tutorials/basic_input_and_output.dart';
import 'package:codekameleon/data/c++/tutorials/basics.dart';
import 'package:codekameleon/data/c++/tutorials/data_types.dart';
import 'package:codekameleon/data/c++/tutorials/if_else.dart';
import 'package:codekameleon/data/c++/tutorials/loops.dart';
import 'package:codekameleon/data/c++/tutorials/object_oriented.dart';
import 'package:codekameleon/data/c++/tutorials/tokens.dart';
import 'package:codekameleon/data/c++/tutorials/variable_scope.dart';
import 'package:codekameleon/model/tutorial_model.dart';

import '../c++/tutorials/introduction.dart';

const List<TutorialModel> cppTutorials = [
  TutorialModel(
      title: "Introduction to C++",
      description: "About C++",
      duration: "4 min",
      content: introduction_to_cpp
  ),
  TutorialModel(
      title: "Basics of C++",
      description: "About C++",
      duration: "4 min",
      content: cpp_basics
  ),
  TutorialModel(
      title: "Tokens in C++",
      description: "About C++",
      duration: "4 min",
      content: token_in_cpp
  ),
  TutorialModel(
      title: "Data Types in C++",
      description: "About C++",
      duration: "4 min",
      content: data_types_in_cpp
  ),
  TutorialModel(
      title: "Variable Scope in C++",
      description: "Variable scope in  C++",
      duration: "5 min",
      content: variable_scope_in_cpp
  ),
  TutorialModel(
      title: "Basic Input and Output in C++",
      description: "Basic Input and Output in C++",
      duration: "4 min",
      content: cppInputAndOutput
  ),
  TutorialModel(
      title: "If else statement in C++",
      description: "If else statement in C++",
      duration: "6 min",
      content: cppIfElse
  ),
  TutorialModel(
      title: "Loops in C++",
      description: "Loops in C++",
      duration: "5 min",
      content: cppLoops
  ),
  TutorialModel(
      title: "Object Orientation in C++",
      description: "Object Orientation in C++",
      duration: "3 min",
      content: cppObjectOrientation
  ),








];