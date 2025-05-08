import 'package:codekameleon/data/c++/tutorials/basics.dart';
import 'package:codekameleon/data/c++/tutorials/data_types.dart';
import 'package:codekameleon/data/c++/tutorials/tokens.dart';
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



];