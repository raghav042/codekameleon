import 'package:codekameleon/data/c++/course.dart';
import 'package:codekameleon/data/c/course.dart';
import 'package:codekameleon/data/java/course.dart';
import 'package:codekameleon/data/javascript/course.dart';
import 'package:codekameleon/data/kotlin/course.dart';
import 'package:codekameleon/data/swift/course.dart';
import 'package:codekameleon/preferences/preferences.dart';

import '../data/dart/dart_language.dart';
import '../model/language_model.dart';

class LanguageHelper {
  const LanguageHelper._();

  static LanguageModel? get recentLanguage {
    final String? recentLanguageName = Preferences.getRecentCourse();
    if (recentLanguageName == null) return null;
    return _languages.firstWhere((e) => e.name == recentLanguageName);
  }

  static List<LanguageModel> get language {
    final String? recentLanguageName = Preferences.getRecentCourse();

    if (recentLanguageName == null) return _languages;
    return _languages.where((e) => e.name != recentLanguageName).toList();
  }

  static const List<LanguageModel> _languages = [
    cCourse,
    cppCourse,
    dartLanguage,
    javaCourse,
    javascriptCourse,
    kotlinCourse,
    swiftCourse,
  ];
}
