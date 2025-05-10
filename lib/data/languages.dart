import 'package:codekameleon/data/c/c_language.dart';
import 'package:codekameleon/data/javascript/javascript_language.dart';
import 'package:codekameleon/model/tutorial_model.dart';

import '../model/language_model.dart';
import 'c++/course.dart';

import 'dart/dart_language.dart';
import 'java/java_language.dart';

import 'kotlin/course.dart';
import 'python/python_language.dart';
import 'swift/course.dart';

const List<LanguageModel> languages = [
  cLanguage,
  cppCourse,
  dartLanguage,
  javaLanguage,
  javaScriptLanguage,
  kotlinCourse,
  swiftCourse,
  pythonLanguage,
];

final List<TutorialModel> allTutorials = [
  ...cLanguage.tutorials,
  ...cppCourse.tutorials,
  ...dartLanguage.tutorials,
  ...javaLanguage.tutorials,
  ...javaScriptLanguage.tutorials,
  ...kotlinCourse.tutorials,
  ...swiftCourse.tutorials,
  ...pythonLanguage.tutorials,
];
