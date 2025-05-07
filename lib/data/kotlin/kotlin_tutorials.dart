import 'package:codekameleon/data/kotlin/tutorials/basics.dart';
import 'package:codekameleon/data/kotlin/tutorials/introduction.dart';
import 'package:codekameleon/data/kotlin/tutorials/operators.dart';
import 'package:codekameleon/model/tutorial_model.dart';

const List<TutorialModel> kotlinTutorials = [
   TutorialModel(
      title: "Introduction to Kotlin",
      description: "About Kotlin",
      duration: "3 min",
      content: introduction_to_kotlin,
  ),
   TutorialModel(
       title: "Basics of Kotlin",
       description: "Basics of Kotlin",
       duration: "8 min",
       content: kotlin_basics,
   ),
  TutorialModel(
      title: "Operators in Kotlin",
      description: "Operators in Kotlin",
      duration: "4 min",
      content: kotlinOperators,
  ),
];