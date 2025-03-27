import 'package:codekameleon/data/python/tutorials/controler_flow_statements.dart';
import 'package:codekameleon/data/python/tutorials/data_structures.dart';
import 'package:codekameleon/data/python/tutorials/functions.dart';
import 'package:codekameleon/data/python/tutorials/loops.dart';
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
  TutorialModel(
    title: "Control Flow Statement",
    description: "Python control flow statements",
    duration: "9 min",
    content: pythonControlFlowStatements,
  ),
  TutorialModel(
    title: "Loops",
    description: "loops in python",
    duration: "12 min",
    content: pythonLoops,
  ),
  TutorialModel(
    title: "Functions",
    description: "Python Functions",
    duration: "8 min",
    content: pythonFunctions,
  ),
  TutorialModel(
    title: "Data Structure",
    description: "Python Data Structures",
    duration: "12 min",
    content: pythonDataStructures,
  ),
];
