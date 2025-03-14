import 'package:codekameleon/model/tutorial_model.dart';

import 'tutorials/basics.dart';
import 'tutorials/introduction.dart';

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
];
