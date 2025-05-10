import 'package:codekameleon/data/kotlin/tutorials/arrays.dart';
import 'package:codekameleon/data/kotlin/tutorials/basics.dart';
import 'package:codekameleon/data/kotlin/tutorials/booleans.dart';
import 'package:codekameleon/data/kotlin/tutorials/classes_and_objects.dart';
import 'package:codekameleon/data/kotlin/tutorials/collections.dart';
import 'package:codekameleon/data/kotlin/tutorials/control_flow.dart';
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
  TutorialModel(
      title: "Booleans in Kotlin",
      description: "Booleans in Kotlin",
      duration: "3 min",
      content: kotlinBooleans,
  ),
  TutorialModel(
      title: "Arrays in Kotlin",
      description: "Arrays in Kotlin",
      duration: "5 min",
      content: kotlinArrays,
  ),
  TutorialModel(
      title: "Control Flow in Kotlin",
      description: "Control Flow in Kotlin",
      duration: "9 min",
      content: kotlinControlFlow,
  ),
  TutorialModel(
      title: "Collections in Kotlin",
      description: "Collections in Kotlin",
      duration: "10 min",
      content: kotlinCollections,
  ),
  TutorialModel(
      title: "Classes and Objects in Kotlin",
      description: "Classes and Objects in Kotlin",
      duration: "9 min",
      content: kotlinClassesAndObject,
  ),


];