import 'package:codekameleon/data/python/tutorials/operators.dart';
import 'package:codekameleon/model/tutorial_model.dart';

import 'tutorials/basics.dart';
import 'tutorials/introduction.dart';
import 'tutorials/variables_and_datatypes.dart';

const List<TutorialModel> pythonTutorials = [
  TutorialModel(
    title: "Introduction of Python",
    description: " About Python",
    duration: "4 min",
    content: introducton_to_python,
  ),
  TutorialModel(
    title: "Basics of Python",
    description: " Basics of Python",
    duration: "6 min",
    content: python_basics,
  ),
  TutorialModel(
    title: "Variables and Data Types",
    description: " Python variables and data types",
    duration: "6 min",
    content: pythonVariablesAndDataTpes,
  ),
  TutorialModel(
    title: "Operators",
    description: " Operators in python",
    duration: "5 min",
    content: pythonOperators,
  ),
];
