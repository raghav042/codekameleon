import 'package:codekameleon/model/tutorial_model.dart';

import '../model/language_model.dart';
import 'c++/course.dart';
import 'c/course.dart';
import 'dart/dart_language.dart';
import 'java/java_language.dart';
import 'javascript/course.dart';
import 'kotlin/course.dart';
import 'python/python_language.dart';
import 'swift/course.dart';

const List<LanguageModel> languages = [
  cCourse,
  cppCourse,
  dartLanguage,
  javaLanguage,
  javascriptCourse,
  kotlinCourse,
  swiftCourse,
  pythonLanguage,
];

final List<TutorialModel> allTutorials = [
  ...cCourse.tutorials,
  ...cppCourse.tutorials,
  ...dartLanguage.tutorials,
  ...javaLanguage.tutorials,
  ...javascriptCourse.tutorials,
  ...kotlinCourse.tutorials,
  ...swiftCourse.tutorials,
  ...pythonLanguage.tutorials,
];
